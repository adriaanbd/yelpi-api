# frozen_string_literal: true

class V1::VitalsController < ApplicationController
  before_action :pundit_user

  def index
    patient = find_patient
    vitals = patient.vitals
    render :vitals, locals: { vitals: vitals }, status: 200
  end

  def show
    patient = find_patient
    return unless patient
    vital = find_vital(patient)
    authorize vital
    render :vital, locals: { vital: vital }, status: 200
  end

  def create
    patient = find_patient
    return unless patient

    vital = patient.vitals.build(vital_params)

    if vital.save
      render :vital, locals: { vital: vital }, status: 201
    else
      process_error(vital, 'Cannot create vitals record')
    end
  end

  def update
    patient = find_patient
    return unless patient

    vital = find_vital(patient)
    authorize vital
    if vital.update(vital_params)
      render json: { vital: vital.attributes }, status: :accepted
    else
      process_error(vital, 'Cannot update patient')
    end
  end

  def destroy
    patient = find_patient
    return unless patient
    vital = find_vital(patient)

    authorize vital
    if vital&.destroy
      render json: { status: :accepted, message: 'Deleted the vital', vital: vital.attributes }
    else
      process_error(vital, 'Cannot delete vital')
    end
  end

  private

  def vital_params
    params
      .require(:vital)
      .permit(
        :weight,
        :systolic,
        :diastolic,
        :temperature,
        :mental_condition,
        :physical_health,
        :locomotive
      )
  end

  def find_patient
    patient = pundit_user.patients.find_by(id: params[:patient_id])
    return patient if patient

    find_error('patient')
    nil
  end

  def find_vital(patient)
    vital = patient.vitals.find_by(id: params[:id])
    return vital if vital

    find_error('vital')
    nil
  end
end

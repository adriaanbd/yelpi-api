# frozen_string_literal: true

class V1::Users::ObservedPatientsController < ApplicationController
  before_action :pundit_user

  def index
    patients = pundit_user.observed_patients

    render :patients, locals: { patients: patients }, status: :ok
  end

  def show
    patient = find_patient
    return unless patient

    render :patient, locals: { patient: patient }, status: 200
  end

  def destroy
    patient = find_patient
    return unless patient

    observation = find_observation
    authorize observation
    if observation&.destroy
      render json: { status: :accepted,
                     message: 'Deleted record',
                     observation: observation.attributes }
    else
      process_error(observation, 'Cannot delete observation')
    end
  end

  private

  def find_patient
    patient = pundit_user.observed_patients.find_by(id: params[:id])
    return patient if patient

    find_error('patient')
    nil
  end

  def find_observation
    observation = pundit_user.observations.find_by(patient_id: params[:id])
    return observation if observation

    find_error('observation')
    nil
  end
end

class V1::VitalsController < ApplicationController
  before_action :pundit_user
  
  def index
  end

  def show
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
  end

  def destroy
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
end

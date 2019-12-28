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

  private

  def find_patient
    patient = pundit_user.observed_patients.find_by(id: params[:id])
    return patient if patient

    find_error('patient')
    nil
  end
end

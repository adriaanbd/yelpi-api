class V1::PatientsController < ApplicationController
  before_action :pundit_user
  
  def index
    patients = pundit_user.patients
    render :patients, locals: { patients: patients }, status: 200
  end

  def show
    patient = find_patient
    return unless patient
    render :patient, locals: { patient: patient }, status: 200
  end

  def create
    patient = pundit_user.patients.build(patient_params)

    if patient.save
      render :patient, locals: { patient: patient }, status: :created
    else
      process_error(patient, 'Cannot create patient')
    end
  end

  def update
    patient = find_patient 
    return unless patient

    if patient.update(update_params)
      render json: { patient: patient.attributes }, status: :accepted 
    else 
      process_error(patient, 'Cannot update patient')
    end
  end

  def destroy
    patient = find_patient
    if patient&.destroy
      render json: { status: :accepted, message: 'Deleted the patient', patient: patient.attributes }
    else
      process_error(patient, 'Cannot delete patient')
    end
  end

  private

  def patient_params
    params.require(:patient).permit(
      :given_name,
      :last_name,
      :birthdate,
      :gender,
      :profile_pic,
      :relationship
    )
  end

  def find_patient
    patient = pundit_user.patients.find_by(id: params[:id])
    return patient if patient
    find_error(patient)
    nil
  end
  
  def update_params
    params.require(:patient).permit(
      :given_name,
      :last_name,
      :birthdate,
      :gender,
      :profile_pic,
      :relationship
    ).merge(registrant: pundit_user)
  end
end

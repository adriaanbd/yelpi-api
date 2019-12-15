class V1::PatientsController < ApplicationController
  before_action :pundit_user
  
  def index
    patients = pundit_user.patients
  end

  def show
    patient = find_patient
    return unless patient
    render json: {patient: patient.attributes.merge(
      profile_pic: rails_blob_path(patient.profile_pic, only_path: true))}
  end

  def create
    patient = pundit_user.patients.build(patient_params)

    if patient.save
      render json: { 
        patient: patient.attributes.merge(profile_pic: rails_blob_path(patient.profile_pic, only_path: true))
      }, status: :created
    else
      render json: { message: 'Cannot create patient', errors: patient.errors }
    end
  end

  def update
    patient = find_patient 
    return unless patient

    if patient.update(update_params)
      render json: { patient: patient.attributes }, status: :accepted 
    else 
      render json: { message: 'Cannot update patient' }
    end
  end

  def destroy
    patient = find_patient
    if patient&.destroy
      render json: { status: :accepted, message: 'Deleted the patient', patient: patient.attributes }
    else
      render json: { message: 'Could not delete patient' }
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
    render json: { error: "Can\'t find patient" }
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

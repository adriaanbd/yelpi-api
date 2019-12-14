class V1::PatientsController < ApplicationController
  before_action :pundit_user

  def index
  end

  def show
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

  def upate
  end

  def destroy
  end

  private

  def patient_params
    params
      .require(:patient)
      .permit(
        :given_name,
        :last_name,
        :birthdate,
        :gender,
        :profile_pic,
        :relationship
      )
  end
end

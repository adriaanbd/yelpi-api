class V1::Users::ObservedPatientsController < ApplicationController
  before_action :pundit_user
  
  def index
    observed_patients = pundit_user.observed_patients

    render :patients, locals: { patients: observed_patients }, status: :ok
  end
end

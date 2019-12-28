# frozen_string_literal: true

class V1::ObservationsController < ApplicationController
  before_action :pundit_user

  def create
    patient = find_patient
    return unless patient

    observation = patient.observations.build(obs_params)

    if observation.save
      render :observation, locals: { observation: observation },
                           status: 201
    else
      process_error(observation, 'Cannot create observation record')
    end
  end

  private

  def obs_params
    params.require(:observation).permit(:observer_id)
  end

  def find_patient
    patient = pundit_user.patients.find_by(id: params[:patient_id])
    return patient if patient

    find_error('patient')
    nil
  end
end

# frozen_string_literal: true

class V1::ObservationsController < ApplicationController
  before_action :pundit_user

  def create
    patient = find_patient
    return unless patient

    observation = patient.observations.build(obs_params)

    authorize observation
    if observation.save
      render :observation, locals: { observation: observation },
                           status: 201
    else
      process_error(observation, 'Cannot create observation record')
    end
  end

  def destroy
    patient = find_patient
    return unless patient

    observation = find_observation(patient)
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

  def obs_params
    params.require(:observation).permit(:observer_id)
  end

  def find_patient
    patient = pundit_user.patients.find_by(id: params[:patient_id])
    return patient if patient

    find_error('patient')
    nil
  end

  def find_observation(patient)
    observation = patient.observations.find_by(observer_id: params[:id])
    return observation if observation

    find_error('observation')
    nil
  end
end

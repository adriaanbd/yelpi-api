# frozen_string_literal: true

class V1::MedicationsController < ApplicationController
  before_action :pundit_user

  def index
    load_patient
    load_medications
    render_medications
  end

  def show
    load_patient
    load_medication
    authorize @medication
    render_medication
  end

  def create
    load_patient
    build_medication
    save_medication || raise_error('Failed to create record')
  end

  def update
    load_patient
    load_medication
    authorize @medication
    update_medication || raise_error('Failed to update record')
  end

  def destroy
    load_patient
    load_medication
    authorize @medication
    destroy_medication || raise_error('Failed to delete record')
  end

  private

  def med_params
    med_params = params.require(:medication)
    med_params
      .permit(
        :name,
        :frequency,
        :duration,
        :dosage,
        :time,
        :date,
        :forma
      )
  end

  def load_patient
    @patient = patient_scope.find(params[:patient_id])
    find_error('patient') unless @patient
  end

  def patient_scope
    pundit_user.patients
  end

  def build_medication
    @medication = med_scope.build(med_params)
  end

  def med_scope
    @patient.medications
  end

  def render_medication
    render :medication, locals: { medication: @medication },
                        status: 200
  end

  def render_medications
    render :medications, locals: { medications: @medications },
                         status: 200
  end

  def save_medication
    return unless @medication.save

    render_medication
  end

  def update_medication
    return unless @medication.update(med_params)

    render json: { medication: @medication.attributes },
           status: :accepted
  end

  def load_medication
    @medication = med_scope.find(params[:id])
    find_error('medication') unless @medication
  end

  def load_medications
    @medications = @patient.medications
  end

  def destroy_medication
    return unless @medication&.destroy

    render json: { status: :accepted,
                   message: 'Deleted record',
                   medication: @medication.attributes }
  end

  def raise_error(message)
    process_error(@medication, message)
  end
end

class Doctors::MedicalRecordsController < ApplicationController
  load_and_authorize_resource

  def new
    @medical_record = MedicalRecord.new
  end

  def create
    @medical_record = MedicalRecord.new(medical_record_params)
    @medical_record.doctor = current_user
    @medical_record.save
    redirect_to @medical_record.patient
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:comments, :condition, :medication, :reports)
  end
end

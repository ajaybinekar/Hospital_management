class Patients::MedicalRecordsController < ApplicationController
  def download_pdf
    @medical_record = MedicalRecord.find(params[:id])
    pdf = Prawn::Document.new
    pdf.text "Patient Medical Record"
    pdf.text "Comments: #{@medical_record.comments}"
    send_data pdf.render, filename: "medical_record_#{@medical_record.id}.pdf", type: 'application/pdf', disposition: 'inline'
  end
end
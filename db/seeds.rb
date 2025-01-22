# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



departments = ['Cardiology', 'Neurology', 'Orthopedics', 'Pediatrics', 'General Medicine']
departments.each do |department_name|
  Department.create(name: department_name)
end

Department.all.each do |department|
  3.times do |i|
    room = Room.create(name: "#{department.name} Room #{i+1}", capacity: 4, department: department)
    # Create beds for each room
    4.times do |j|
      Bed.create(bed_number: "B#{j+1}", room: room, available: true)
    end
  end
end

admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :admin
)

doctors = [
  { first_name: 'John', last_name: 'Doe', department_name: 'Cardiology' },
  { first_name: 'Jane', last_name: 'Smith', department_name: 'Neurology' },
  { first_name: 'Robert', last_name: 'Brown', department_name: 'Orthopedics' },
  { first_name: 'Emily', last_name: 'Davis', department_name: 'Pediatrics' },
  { first_name: 'Michael', last_name: 'Wilson', department_name: 'General Medicine' }
]

doctors.each do |doctor_data|
  department = Department.find_by(name: doctor_data[:department_name])
  User.create!(
    first_name: doctor_data[:first_name],
    last_name: doctor_data[:last_name],
    email: "#{doctor_data[:first_name].downcase}.#{doctor_data[:last_name].downcase}@hospital.com",
    password: 'password',
    password_confirmation: 'password',
    role: :doctor,
    department: department
  )
end

patients = [
  { first_name: 'Alice', last_name: 'Johnson', gender: 'Female', blood_group: 'O+', date_of_birth: '1990-05-12' },
  { first_name: 'David', last_name: 'Martinez', gender: 'Male', blood_group: 'A-', date_of_birth: '1985-08-23' },
  { first_name: 'Sophia', last_name: 'Lopez', gender: 'Female', blood_group: 'B+', date_of_birth: '2000-12-15' },
  { first_name: 'James', last_name: 'Miller', gender: 'Male', blood_group: 'AB+', date_of_birth: '1975-02-19' }
]

patients.each do |patient_data|
  User.create!(
    first_name: patient_data[:first_name],
    last_name: patient_data[:last_name],
    email: "#{patient_data[:first_name].downcase}.#{patient_data[:last_name].downcase}@patient.com",
    password: 'password',
    password_confirmation: 'password',
    role: :patient,
    date_of_birth: patient_data[:date_of_birth],
    gender: patient_data[:gender],
    blood_group: patient_data[:blood_group]
  )
end

Patient.all.each do |patient|
  doctor = Doctor.order('RANDOM()').first # Randomly select a doctor
  Appointment.create!(
    doctor: doctor,
    patient: patient,
    appointment_time: Time.now + rand(1..7).days, # Random appointment within the next 7 days
    status: 'Scheduled'
  )
end

Patient.all.each do |patient|
  doctor = Doctor.order('RANDOM()').first # Randomly assign a doctor
  MedicalRecord.create!(
    patient: patient,
    doctor: doctor,
    comments: 'Patient showed symptoms of fatigue and mild chest pain.',
    condition: 'Mild Cardiovascular Concerns',
    medication: 'Beta blockers, Rest, Diet control',
    reports: 'EKG and Blood Pressure report attached'
  )
end

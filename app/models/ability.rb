class Ability
  include CanCan::Ability
  def initialize(user)
  user ||= User.new

  if user.admin?
  can :manage, :all
  elsif user.doctor?
  can :read, Patient, doctor_id: user.id
  can :manage, Appointment, doctor_id: user.id
  can :manage, MedicalRecord, doctor_id: user.id
  elsif user.patient?
  can :manage, Patient, id: user.id
  can :read, Appointment, patient_id: user.id
  can :read, MedicalRecord, patient_id: user.id
  end
  end
end
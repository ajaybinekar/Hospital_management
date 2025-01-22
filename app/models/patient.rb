class Patient < ApplicationRecord
  belongs_to :user
  has_many :doctors, through: :appointments
  has_one :medical_record
  has_many :appointments
end

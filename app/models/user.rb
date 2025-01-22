class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department, optional: true
  # enum role: { admin: 0, doctor: 1, patient: 2 }

  validates :email, presence: true
  validates :role, presence: true
end

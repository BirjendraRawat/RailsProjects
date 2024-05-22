class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  GENERAL_PHYSICIANS = 'General_Physician'.freeze
  ORTHOPEADICS = 'Orthopeadics'.freeze
  GYNAE = 'Gynae'.freeze
  PEDATRIC = 'Pedatric'.freeze
  NEUROLOGY = 'Neurology'.freeze
  DERMATOLOGY = 'Dermatology'.freeze
  DENTISTRY = 'Dentistry'.freeze
  DEPARTMENTS = {
    "General Physicians" => GENERAL_PHYSICIANS,
    "Orthopeadics" => ORTHOPEADICS,
    "Gynaecology" => GYNAE,
    "Pediatric" => PEDATRIC ,
    "Neurology" => NEUROLOGY,
    "Dermatology" => DERMATOLOGY,
    "Dentists" => DENTISTRY
  }

         # validates :name , presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email, presence: true, length: { maximum: 255 },
   format: { with: VALID_EMAIL_REGEX }, uniqueness: true)

  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def General_Phycians?
    department == GENERAL_PHYSICIANS
  end

  def Orthopeadics?
    department == ORTHOPEADICS
  end

  def Gynae?
    department == GYNAE
  end

  def Pedatric?
    department == PEDATRIC
  end

  def Neurology?
    department == NEUROLOGY
  end

  def Dermatology?
    department == DERMATOLOGY
  end

  def Dentistry?
    department == DENTISTRY
  end
end

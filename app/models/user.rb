class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :schedules

  validates_presence_of :name, :address
  validates_uniqueness_of :cpf, :email
  validates_cpf :cpf
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

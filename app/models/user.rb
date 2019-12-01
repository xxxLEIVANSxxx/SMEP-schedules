class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :schedules

  validates_presence_of :name, :address, :cpf
  validates_uniqueness_of :cpf, :email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

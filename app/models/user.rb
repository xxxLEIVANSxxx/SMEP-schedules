class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :schedules

  validates_presence_of :name, :address
  validates_uniqueness_of :cpf, :email
  validates_cpf :cpf
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def can_schedule?
    schedules.joins(:hour).where(:status => "true", :hours => { date: Date.current..Date.current.end_of_month }).count <= 1
  end
end

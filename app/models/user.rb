class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { [name.downcase!, surname.downcase!] }
  validates :given_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_confirmation_of :password
end

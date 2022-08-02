class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname , presence: true
  validates :chinese_last_name , presence: true
  validates :chinese_first_name , presence: true
  validates :japanese_last_name , presence: true
  validates :japanese_first_name , presence: true
  validates :date_of_birth , presence: true

  has_many :items
  has_mane :dealings

end

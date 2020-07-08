class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, length: { in: 3..15 }, presence: true
  validates :lastname, length: { in: 3..15 }, presence: true
end

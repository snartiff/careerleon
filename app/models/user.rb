class User < ApplicationRecord
  has_many :goals
  has_many :steps

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 validates :username, presence: true, length: { minimum: 4, maximum: 16 }
 validates :first_name, presence: true
 validates :last_name, presence: true
end

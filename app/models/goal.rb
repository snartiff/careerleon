class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :steps

  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
end

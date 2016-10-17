class Step < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal

  validates :description, presence: true
  validates :deadline, presence: true
end

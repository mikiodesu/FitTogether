class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_details, dependent: :destroy
  accepts_nested_attributes_for :workout_details, allow_destroy: true
  
end

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :workout_id, uniqueness: { scope: :user_id }
end

class WorkoutDetail < ApplicationRecord
  belongs_to :workout
  enum bodypart: {
    chest: 0,
    back: 1,
    shoulders: 2,
    legs: 3,
    arms: 4,
    abs: 5
  }

  validates :bodypart, presence: { message: "は必ず入力してください" }
  validates :exercise_name, presence: { message: "は必ず入力してください" }
  validates :weight, presence: { message: "は必ず入力してください" }
  validates :reps, presence: { message: "は必ず入力してください" }
  validates :sets, presence: { message: "は必ず入力してください" }

end

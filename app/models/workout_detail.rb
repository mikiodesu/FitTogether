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
end

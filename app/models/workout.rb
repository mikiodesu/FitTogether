class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_details, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :workout_details, allow_destroy: true

  validates :memo, presence: { message: "は必ず入力してください" }

   
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end

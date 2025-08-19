class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  validates :content, presence: true
end

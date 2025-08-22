class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :workouts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # フォローする側
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # フォローされる側
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 12 }
  validates :introduction, length: { maximum: 100 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

   # 検索メソッド
  def self.search_for(content, method)
    return all if content.blank?
  
    case method
    when "perfect"
      where(name: content)
    when "forward"
      where("name LIKE ?", "#{content}%")
    when "backward"
      where("name LIKE ?", "%#{content}")
    else # partial
      where("name LIKE ?", "%#{content}%")
    end
  end

  def follow(user)
    relationships.find_or_create_by(followed: user)
  end

  def unfollow(user)
    relationships.find_by(followed: user)&.destroy
  end

  def following?(user)
    followings.include?(user)
  end

end

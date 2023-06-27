class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_groups, through: :likes, source: :group
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :fan, length: { maximum: 50}
  validates :fan2, length: { maximum: 50}
  validates :fan3, length: { maximum: 50}
  def already_liked?(group)
    self.likes.exists?(group_id: group.id)
  end

end

class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: { maximum: 50 }
    has_many :hashtag_groups, dependent: :destroy
    has_many :groups, through: :hashtag_groups
end

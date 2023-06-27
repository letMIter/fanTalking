class HashtagGroup < ApplicationRecord
  belongs_to :group
  belongs_to :hashtag
  validates :group_id, presence: true
  validates :hashtag_id, presence: true
end

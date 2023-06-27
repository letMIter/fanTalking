class TagMap < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :tag
end

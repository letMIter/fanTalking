class Tag < ApplicationRecord
    validates :tag_name, presence: true 
    has_many :tag_maps, dependent: :destroy
    has_many :groups, through: :tag_maps, dependent: :destroy
    has_many :users, through: :tag_maps, dependent: :destroy
end

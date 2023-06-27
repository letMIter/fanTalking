class Group < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :hashtag_groups, dependent: :destroy
    has_many :hashtags, through: :hashtag_groups

    after_create do
        group = Group.find_by(id: id)
        # hashbodyに打ち込まれたハッシュタグを検出
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            # ハッシュタグは先頭の#を外した上で保存
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            group.hashtags << tag
        end
    end
        #更新アクション
    before_update do
        group = Group.find_by(id: id)
        # group.hashtags.clear
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            group.hashtags << tag
        end
    end
end

module GroupsHelper
    def render_with_hashtags(hashbody)
        return if hashbody.nil?
    
        hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
end
end

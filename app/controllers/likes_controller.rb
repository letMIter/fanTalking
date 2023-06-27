class LikesController < ApplicationController
def create
    like = current_user.likes.create(group_id: params[:group_id])
    redirect_back(fallback_location: root_path)
end

def destroy
    like = Like.find_by(group_id: params[:group_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
end

end

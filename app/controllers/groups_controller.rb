class GroupsController < ApplicationController
before_action :authenticate_user!
    def hashtag
        if params[:name].nil?
            @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.groups.count}
        else
            name = params[:name]
            name = name.downcase
            @hashtag = Hashtag.find_by(hashname: name)
            @group = @hashtag.groups
            @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.groups.count}
        end
    end

    def index
        @groups = Group.all
        @fan = current_user.fan
        @fan2 = current_user.fan2
        @fan3 = current_user.fan3
        @group = Group.all
        if params[:search] == nil
            @groups= Group.all
        elsif params[:search] == ''
            @groups= Group.all
        else
        #部分検索
        @groups = Group.where("hashbody LIKE ? ",'%' + params[:search] + '%')
        end
    end
    def new
        @group = Group.new
        @fan = current_user.fan
        @fan2 = current_user.fan2
        @fan3 = current_user.fan3
    end
    def create
        group = Group.new(group_params)
        group.user_id = current_user.id
        if group.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @group = Group.find(params[:id])
        @comments = @group.comments
        @comment = Comment.new
    end
    def edit
        @group = Group.find(params[:id])
    end
    def update
        group = Group.find(params[:id])
        if group.update(group_params)
            redirect_to :action => "index", :id => group.id
        else
            redirect_to :action => "new"
        end
    end
    def destroy
        group = Group.find(params[:id])
        if group.destroy
            redirect_to action: :index, notice: "アウトプットを削除しました"
        else
            flash.now[:danger] = "削除に失敗しました"
            redirect_to :action => "show"
        end

        # group.destroy
        # redirect_to action: :index
    end

    private
    def group_params
        params.require(:group).permit(:name,:hashbody,:image,:content,:fan,:user_id,groups: [], hashtag_ids: [])
    end
end

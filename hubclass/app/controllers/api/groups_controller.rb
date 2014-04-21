class Api::GroupsController < ApiController

  def index
    found?(@user = User.find(params[:user_id])) do
      @groups = @user.groups.order_by(:created_at.desc).concat(@user.owner_groups.order_by(:created_at.desc))
    end
  end

  def show
    found?(@user = User.find(params[:user_id])) do
      @group = @user.groups.find(params[:group_id])
    end
  end

end
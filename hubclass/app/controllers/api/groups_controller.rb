class Api::GroupsController < ApiController

  def index
    found?(@user = User.find(params[:user_id])) do
      @groups = @user.groups.order_by(:created_at.desc)
    end
  end

end
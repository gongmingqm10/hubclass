class Api::GroupsController < ApiController

  def index
    found?(@user = User.find(params[:user_id])) do
      @groups = @user.groups.order_by(:created_at.desc).concat(@user.owner_groups.order_by(:created_at.desc))
    end
  end

  def show
    user_access_group?(params[:id], params[:user_id]) do
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

end
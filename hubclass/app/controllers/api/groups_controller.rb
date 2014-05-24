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

  def absent_student
    user_access_group?(params[:group_id], params[:user_id]) do
      @group.records[params[:student_id]] ||= {}
      @group.records[params[:student_id]]["absence"] ||= 0
      @group.records[params[:student_id]]["absence"] += 1
      @group.save!
      return render status: :ok, json: {absence: @group.records[params[:student_id]]["absence"] }
    end
    return render status: :not_found, json: {}
  end

  def vote_student
    user_access_group?(params[:group_id], params[:user_id]) do
      @group.records[params[:student_id]] ||= {}
      @group.records[params[:student_id]]["vote"] ||= 0
      @group.records[params[:student_id]]["vote"] += 1
      @group.save!
      return render status: :ok, json: {vote: @group.records[params[:student_id]]["vote"]}
    end
    return render status: :not_found, json: {}
  end

end
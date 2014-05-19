class Api::HomeworksController < ApiController
  def create
    user_access_group?(params[:group_id], params[:user_id]) do
      valid?(@assignment = Assignment.create(
          title: params[:title],
          content: params[:content],
          expiration: params[:expiration],
          owner: @owner,
          owner_group: @group,
          workflow: Workflow.new(
              state: 'initial'
          )
      )) do
        return render status: :created, json: {response: 'Homework created successfully'}
      end
    end
    return render status: :not_found, json: {response: 'Don\'t have permission to this group'}
  end

  def created_homeworks
    user_access_group?(params[:group_id], params[:user_id]) do
      @homeworks = Assignment.where(owner: @owner).and(owner_group: @group).order_by(:updated_at.desc)
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

  def submit_homeworks
    user_access_group?(params[:group_id], params[:user_id]) do
      @homeworks = Assignment.where(owner_group: @group)
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end
end
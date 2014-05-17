class Api::HomeworksController < ApiController
  def create
    found?(@group = Group.find(params[:group_id])) do
      @owner = User.find(params[:user_id])
      if @group.user_belongs_group(@owner)
        valid?(@assignment = Assignment.create(
            title: params[:title],
            content: params[:content],
            expiration: params[:expiration],
            workflow: Workflow.new(
              state: 'initial'
            )
        )) do
          return render status: :created, json: {response: 'Homework created successfully'}
        end
       end
    end
    return render status: :not_found, json: {response: 'Don\'t have permission to this group'}
  end
end
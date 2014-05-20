class Api::HomeworksController < ApiController
  def create
    user_access_group?(params[:group_id], params[:user_id]) do
      valid?(@assignment = Assignment.create(
          title: params[:title],
          content: params[:content],
          expiration: params[:expiration],
          owner: @user,
          owner_group: @group,
          workflow: Workflow.new(
              state: 'created'
          )
      )) do
        return render status: :created, json: {response: 'Homework created successfully'}
      end
    end
    return render status: :not_found, json: {response: 'Don\'t have permission to this group'}
  end

  def get_created_homeworks
    user_access_group?(params[:group_id], params[:user_id]) do
      @homeworks = Assignment.where(owner: @user).and(is_answer: false).and(owner_group: @group).order_by(:updated_at.desc)
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

  def get_todo_homeworks
    user_access_group?(params[:group_id], params[:user_id]) do
      if @group.teacher == @user
        return render status: :ok, json: {}
      else
        @homeworks = Assignment.where(owner_group: @group).and(is_answer: false).order_by(:updated_at.desc)
        return render status: :ok
      end
    end
    return render status: :not_found, json: {}
  end

  def show_remark_homework

  end

  def show_submit_homework
    user_access_group?(params[:group_id], params[:user_id]) do
      @homework = Assignment.find(params[:id])
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

  def submit_homework
    user_access_group?(params[:group_id], params[:user_id]) do
      valid?(@answer = Assignment.create(
          content: params[:content],
          is_answer: true,
          owner: @user,
          owner_group: @group,
          workflow: Workflow.new(
              state: 'remark'
          ))
      ) do
        if params[:files]
          params[:files].each do |file|
            attachment = Attachment.find(file)
            @answer.attachments.push(attachment)
          end
          @answer.save!
        end
        homework = Assignment.find(params[:homework_id])
        homework.workflow.participants[@user.id.to_s] = @answer.id.to_s
        homework.save!
        return render status: :created
      end
    end
    render status: :not_found, json: {}
  end

end
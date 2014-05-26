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
              state: 'preparation'
          )
      )) do
        @group.members.each do |member|
          @assignment.workflow.participants[member.id.to_s] = {}
        end
        @assignment.save!
        return render status: :created, json: {response: 'Homework created successfully'}
      end
    end
    return render status: :not_found, json: {response: 'Don\'t have permission to this group'}
  end

  def show
    user_access_group?(params[:group_id], params[:user_id]) do
      @homework = Assignment.find(params[:id])
      return render status: :ok
    end
    return render status: :not_found, json: {}
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
        return render status: :ok, json: []
      else
        @homeworks = Assignment.where(owner_group: @group).and(is_answer: false).order_by(:updated_at.desc)
        return render status: :ok
      end
    end
    return render status: :not_found, json: {}
  end

  def show_remark_homework
    submitter_id = params[:submitter_id]
    user_access_group?(params[:group_id], params[:user_id]) do
      @homework = Assignment.find(params[:id])
      @status = "preparation"
      if answer_id = @homework.workflow.participants[submitter_id]
        @status = "remark"
        @answer = Assignment.find(answer_id)
        @status = "finish" if @answer.remark
      end
      return render status: :ok
    end
    return render status: :not_found, json: {}



  end

  def show_submit_homework
    user_access_group?(params[:group_id], params[:user_id]) do
      @homework = Assignment.find(params[:id])
      answer_id = @homework.workflow.participants[session[:user_id]]
      if answer_id
        @answer = Assignment.find(answer_id)
      end
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

  def remark_submit
    user_access_group?(params[:group_id], params[:user_id]) do
      answer = Assignment.find(params[:homework_id])
      answer.remark = Remark.new(
          mark: params[:mark],
          detail: params[:detail]
      )
      answer.workflow.state = 'finish'
      answer.save!
      return render status: :ok, json: {response: 'success remark this homework'}
    end
    return render status: :not_found, json: {}
  end

  def all_todo
    found?(@user= User.find(params[:user_id])) do
      group_ids = []
      @user.groups.each do |group|
        group_ids.push(group.id.to_s)
      end
      @homeworks = Assignment.where(:owner_group_id.in => group_ids).and(:is_answer => false).order_by(:updated_at.desc)
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

  def all_created
    found?(@user= User.find(params[:user_id])) do
      group_ids = []
      @user.owner_groups.each do |group|
        group_ids.push(group.id.to_s)
      end
      @homeworks = Assignment.where(:owner_group_id.in => group_ids).and(:is_answer => false).order_by(:updated_at.desc)
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end
end
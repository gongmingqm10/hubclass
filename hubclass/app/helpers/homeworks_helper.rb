module HomeworksHelper
  def operate_permission(homework)
    homework.workflow.submittable?(session[:user_id])
  end
end
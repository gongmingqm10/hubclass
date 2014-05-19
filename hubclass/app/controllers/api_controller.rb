class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  respond_to :json

  protected

  def found?(*args)
    if (args.all? { |arg| arg != nil })
      yield if block_given?
      return true
    else
      render status: :not_found, json: {}
      return false
    end
  end

  def valid?(target)
    errors = target.respond_to?(:errors) ? target.errors : target
    if errors.empty?
      yield if block_given?
      return true
    else
      render status: :bad_request, json: errors
      return false
    end
  end

  def user_access_group?(group_id, user_id)
    found?(@group = Group.find(group_id)) do
      @user = User.find(user_id)
      if @group.user_belongs_group(@user)
        yield if block_given?
        return true
      else
        render status: :not_found, json: {}
        return false
      end
    end
  end

  def current_user
    User.find(session[:user_id])
  end

end
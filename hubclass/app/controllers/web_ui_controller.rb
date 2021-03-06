require "OpenTok"

class WebUiController < ApplicationController

  before_action :login?, except: [:login, :sessions, :layout]

  rescue_from CanCan::AccessDenied do |exception|
    session.delete(:user_id)
    cookies.delete(:user)
    redirect_to login_path, :alert => 'Access Denied'
  end

  def login
    render 'login', layout: nil
  end

  def logout
    session.delete(:user_id)
    cookies.delete(:user)
    redirect_to login_path
  end

  def sessions
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id.to_s
      cookies[:user] = user_info(user)
      if user.role == 'admin'
        redirect_to admin_path
      else
        redirect_to root_path
      end
    else
      @error = true
      render 'login', layout: nil
    end
  end

  def index
    redirect_to action: :course, status: :found
  end

  def course
    render 'course'
  end

  def course_all
    render partial: 'web_ui/course/all', layout: nil
  end

  def group_show
    @group_id = params[:group_id]
    render 'group'
  end

  def group_all
    render partial: 'web_ui/group/all', layout: nil
  end

  def group_video
    @session_id = params[:session_id]
    opentok = OpenTok::OpenTok.new ENV["OPENTOK_API_KEY"], ENV["OPENTOK_API_SECRET"]
    @token = opentok.generate_token @session_id
    @api_key = ENV["OPENTOK_API_KEY"]
    render 'video'
  end

  def note_new
    render partial: 'web_ui/group/note/new', layout: nil
  end

  def note_show
    render partial: 'web_ui/group/note/show', layout: nil
  end

  def homework_new
    render partial: 'web_ui/group/homework/new', layout: nil
  end

  def homework_remark
    render partial: 'web_ui/shared/homework/remark', layout: nil
  end

  def homework_submit
    render partial: 'web_ui/shared/homework/submit', layout: nil
  end

  def homework_show_origin
    render partial: 'web_ui/shared/homework/show', layout: nil
  end

  def assignment
    render 'assignment'
  end

  def assignment_all
    render partial: 'web_ui/assignment/all', layout: nil
  end

  def attachment
    render 'attachment'
  end

  private

  def user_info(user)
    {
        id: user.id.to_s,
        user_number: user.user_number,
        role: user.role,
        expires: 1.hour.from_now
    }.to_json
  end

  def login?
    json = cookies[:user].blank? ? {} : JSON.parse(cookies[:user])
    if json['id'].blank? || json['id'] != session['user_id']
      redirect_to login_path
    end
  end

end
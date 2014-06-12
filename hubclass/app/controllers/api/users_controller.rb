class Api::UsersController < ApiController
  def show
    found?(@user = User.find(params[:id])) do
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end
end
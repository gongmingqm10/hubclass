class Api::NotesController < ApiController

  def index
    found?(@group = Group.find(params[:group_id])) do
      @notes = Note.where(group: @group)
      return render status: :ok
    end
    render status: :not_found, json: {}
  end

  def create
    found?(@group = Group.find(params[:group_id])) do
      @owner = User.find(params[:user_id])
      if @group.user_belongs_group(@owner)
        valid?(@note = Note.create(
            title: params[:title],
            content: params[:content],
            owner: @owner,
            group: @group)
        ) do
          return render status: :created
        end
      end
    end
    render status: :bad_request, json: {}
  end

end
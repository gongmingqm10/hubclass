class Api::NotesController < ApiController
  def create
    user_id = params[:user_id]
    group_id = params[:group_id]
    title = params[:title]
    content = params[:content]
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
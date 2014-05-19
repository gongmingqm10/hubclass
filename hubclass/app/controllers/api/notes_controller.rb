class Api::NotesController < ApiController

  def index
    found?(@group = Group.find(params[:group_id])) do
      @notes = Note.where(owner_group: @group).order_by(:updated_at.desc)
      return render status: :ok
    end
    render status: :not_found, json: {}
  end

  def create
    user_access_group?(params[:group_id], params[:user_id]) do
      valid?(@note = Note.create(
          title: params[:title],
          content: params[:content],
          tags: params[:tags],
          owner: @owner,
          owner_group: @group)
      ) do
        params[:files].each do |file|
          attachment = Attachment.find(file)
          attachment.note = @note
          attachment.save
        end
        return render status: :created
      end
    end
    render status: :not_found, json: {}
  end

  def show
    user_access_group?(params[:group_id], params[:user_id]) do
      @note = Note.find(params[:id])
      return render status: :ok
    end
    return render status: :not_found, json: {}
  end

end
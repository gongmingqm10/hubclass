class Api::FilesController < ApiController
  def create
    file_data = params[:file]
    found?(@user = User.find(session['user_id'])) do
      uploader = FileUploader.new
      uploader.store!(file_data)
      @url = uploader.url
      valid?(
          @attachment = Attachment.create(
              filename: file_data.original_filename,
              url: @url,
              size: file_data.size,
              owner: @user
          )
      ) do
        return render status: :created
      end
    end
    return render status: :bad_request, json: {}
  end
end
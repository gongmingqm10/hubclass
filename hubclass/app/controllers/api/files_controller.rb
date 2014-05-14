class Api::FilesController < ApiController
  def create
    uploader = FileUploader.new
    uploader.store!(params[:file])
    @url = uploader.url
  end
end
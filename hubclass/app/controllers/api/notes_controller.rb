class Api::NotesController < ApiController
  def create
    render status: :created, json: ""
  end
end
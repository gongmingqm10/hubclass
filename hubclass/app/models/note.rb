class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  field :share, type: Boolean, default: true
  field :tags, type: Array, default: []

  belongs_to :owner, class_name: 'User', inverse_of: :notes
  belongs_to :owner_group, class_name: 'Group', inverse_of: :notes

  has_many :attachments, class_name: 'Attachment'



  def has_attachment?
    !attachments.empty?
  end


end
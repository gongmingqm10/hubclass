class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  field :url, type: String
  field :type, type: String
  field :size, type: Integer

  belongs_to :owner, class_name: 'User', inverse_of: :notes
  belongs_to :owner_group, class_name: 'Group', inverse_of: :attachments

end
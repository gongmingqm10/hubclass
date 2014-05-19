class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  field :url, type: String
  field :type, type: String
  field :size, type: Integer

  belongs_to :owner, class_name: 'User', inverse_of: :attachments
  belongs_to :owner_group, class_name: 'Group', inverse_of: :attachments
  has_and_belongs_to_many :portfolios, class_name: 'Portfolio', inverse_of: :attachments

end
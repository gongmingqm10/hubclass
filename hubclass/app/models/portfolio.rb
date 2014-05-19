class Portfolio
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String

  belongs_to :owner, class_name: 'User', inverse_of: :portfolios
  belongs_to :owner_group, class_name: 'Group', inverse_of: :portfolios
  has_and_belongs_to_many :attachments, class_name: 'Attachment', inverse_of: :portfolios

  def has_attachment?
    attachments.any?
  end
end
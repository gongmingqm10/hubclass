class Assignment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  field :expiration, type: Date

  validates_presence_of :title, :expiration

  belongs_to :author, class_name: 'User', inverse_of: :assignments
  belongs_to :owner_group, class_name: 'Group', inverse_of: :assignments
  embeds_one :workflow



end
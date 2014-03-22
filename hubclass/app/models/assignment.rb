class Assignment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String

  validates_presence_of :title

  belongs_to :group, class_name: 'Group'
  embeds_one :workflow



end
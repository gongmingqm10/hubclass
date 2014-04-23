class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  field :share, type: Boolean, default: true
  field :tags, type: Array, default: []

  belongs_to :owner, class_name: 'User', inverse_of: :notes
  belongs_to :group, class_name: 'Group'


end
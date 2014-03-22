class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String

  belongs_to :owner, class_name: 'User', inverse_of: :notes
  belongs_to :group, class_name: 'Group'


end
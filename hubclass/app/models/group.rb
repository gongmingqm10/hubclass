class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :abstract, type: String

  validates_presence_of :name

  has_and_belongs_to_many :members, class_name: 'User', inverse_of: :groups
  belongs_to :teacher, class_name: 'User', inverse_of: :owner_groups
  belongs_to :course, class_name: 'Course'


end
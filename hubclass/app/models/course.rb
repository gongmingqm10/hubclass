class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :abstract, type: String

  has_many :groups, class_name: 'Group'


  validates_presence_of :name


end
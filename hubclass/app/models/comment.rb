class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type:String
  field :commenter, type: String
  field :anonymous, type: Boolean, default: false

  embedded_in :user, class_name: 'User'
  embedded_in :course, class_name: 'Course'


end
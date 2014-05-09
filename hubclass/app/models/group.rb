class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :abstract, type: String
  field :records, type: Hash

  validates_presence_of :name

  has_and_belongs_to_many :members, class_name: 'User', inverse_of: :groups
  belongs_to :teacher, class_name: 'User', inverse_of: :owner_groups
  belongs_to :course, class_name: 'Course'
  has_many :notes, class_name: 'Note', inverse_of: :owner_group
  has_many :attachments, class_name: 'Attachment', inverse_of: :owner_group
  has_many :assignments, class_name: 'Assignment', inverse_of: :owner_group

  def user_belongs_group(user)
    if self.teacher == user || self.members.include?(user)
      return true
    else
      return false
    end
  end

end
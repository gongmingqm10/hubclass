class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :email, type: String
  field :password_hash, type: String
  field :password_salt, type: String
  field :role, type: String
  field :user_number, type: String

  attr_accessor :password

  before_save :encrypt_password

  validates_inclusion_of :role, in: %w(student teacher faculty admin)
  validates_uniqueness_of :user_number
  validates_presence_of :username, :user_number, :password, :role

  has_many :owner_groups, class_name: 'Group', inverse_of: :teacher
  has_and_belongs_to_many :groups, class_name: 'Group', inverse_of: :members
  has_many :notes, class_name: 'Note'
  has_many :attachments,

  embeds_many :comments, class_name: 'Comment'

  def is_student?
    role == 'student'
  end

  class << self
    def authenticate (username, password)
      user = find_by(username: username)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      end
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
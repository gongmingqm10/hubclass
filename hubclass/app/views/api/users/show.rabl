object @user

attribute :user_number, :username, :branch, :email, :role
node(:id) {|u| u.id.to_s}
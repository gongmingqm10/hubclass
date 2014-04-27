object @group
attribute :name, :abstract
node(:group_id) { |g| g.id.to_s }
child(:members => :members) do
    node(:user_id) { |m| m.id.to_s }
    attribute :username, :user_number, :branch
end
child(:teacher => :teacher) do
    node(:user_id) { |t| t.id.to_s }
    attribute :username, :user_number
end
child(:course => :course) do
    node(:course_id) { |c| c.id.to_s }
    attribute :name, :abstract
end
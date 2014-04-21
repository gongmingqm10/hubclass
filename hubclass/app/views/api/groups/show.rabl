object @group
attribute :name, :abstract, :notes
node(:group_id) { |g| g.id.to_s }
child(:members => :members) do
    node(:user_id) { |m| m.id.to_s }
    attribute :username, :user_number
end
child(:teacher => :teacher) do
    node(:user_id) { |t| t.id.to_s }
    attribute :username, user_number
end
child(:notes => :notes) do
    node(:note_id) { |n| n.id.to_s }
    attribute :title, :content
end
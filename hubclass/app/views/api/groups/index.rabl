collection @groups

node (:id) { |g| g.id.to_s }
attribute :name, :abstract

node(:size) {|g| g.members.size}
child(course: :course) do
    attribute :name
    node(:id) { |c| c.id.to_s }
end

child(teacher: :teacher) do
    attribute :username
    node(:id) { |t| t.id.to_s}
end
collection @groups

attribute :id, :name, :abstract

child(course: :course) do
    attribute :id, :name
end

child(teacher: :teacher) do
    attribute :id, :username
end
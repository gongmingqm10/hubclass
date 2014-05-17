collection @notes
node (:id) { |n| n.id.to_s }
attribute :title, :content, :share, :tags, :updated_at
node (:attach) { |n| n.has_attachment?() }
child(owner: :owner) do
    attribute :username
    node(:owner_id) { |o| o.id.to_s }
end
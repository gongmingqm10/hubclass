collection @notes
node (:id) { |n| n.id.to_s }
attribute :title, :content, :share, :tags, :type, :updated_at
node (:attach) { |n| n.has_attachment?() }
node (:typename) {|n| getTypeName(n.type) }
child(owner: :owner) do
    attribute :username
    node(:owner_id) { |o| o.id.to_s }
end
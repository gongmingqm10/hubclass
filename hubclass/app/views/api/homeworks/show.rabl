object @homework
node (:id) { |n| n.id.to_s }
attribute :title, :content, :expiration, :updated_at
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
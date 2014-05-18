collection @homeworks
node (:id) { |n| n.id.to_s }
attribute :title, :expiration, :updated_at
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
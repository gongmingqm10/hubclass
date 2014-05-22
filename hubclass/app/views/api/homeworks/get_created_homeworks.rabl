collection @homeworks

node (:id) { |n| n.id.to_s }
node(:participants) { |h| h.workflow.participants.size()}
attribute :title, :expiration, :updated_at
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
child(@group) do
    node(:id) { |g| g.id.to_s }
    child(members: :members) do
        attribute :username
        node(:id) { |m| m.id.to_s }
    end
    node(:members_size) { |g| g.members.size()}
end

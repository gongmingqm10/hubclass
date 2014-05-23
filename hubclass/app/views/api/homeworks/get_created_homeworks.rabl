collection @homeworks

attribute :title, :expiration, :updated_at

node (:id) { |n| n.id.to_s }
node(:submit_number) { |h| h.workflow.submit_number()}
node(:members_size) {|h| h.workflow.participants.size()}

node(:members) {|h| h.workflow.operate_status()}

child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end


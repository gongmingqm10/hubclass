collection @homeworks
node (:id) { |h| h.id.to_s }
attribute :title, :expiration, :updated_at
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
node(:submittable) { |h| operate_permission(h)}
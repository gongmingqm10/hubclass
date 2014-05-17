object @note
attribute :title, :content, :tags, :updated_at
node(:note_id) { |n| n.id.to_s }
child(owner: :author) do
    attribute :username
    node(:id) { |t| t.id.to_s }
end
child(attachments: :attachments) do
    attribute :filename, :url
    node(:id) { |a| a.id.to_s }
end
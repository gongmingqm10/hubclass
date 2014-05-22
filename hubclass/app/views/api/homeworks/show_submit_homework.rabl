object @homework
node (:id) { |n| n.id.to_s }
attribute :title, :content, :expiration, :updated_at
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
child(@answer) do
    node(:id) {|a| a.id.to_s}
    attribute :content
    child(attachments: :attachments) do
        attribute :filename, :url
        node(:id) { |a| a.id.to_s }
    end
end
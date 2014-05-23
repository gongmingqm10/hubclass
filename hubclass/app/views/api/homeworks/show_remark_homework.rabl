object @homework

node(:id) {|h| h.id.to_s}
attribute :title, :content, :expiration, :updated_at
node(:status) {|h| @status}
child(owner: :author) do
    attribute :username
    node(:id) { |o| o.id.to_s }
end
child(attachments: :attachments) do
    attribute :filename, :url
    node(:id) { |a| a.id.to_s }
end

child(@answer => :answer) do |a|
    node(:id) {|a| a.id.to_s}
    attribute :content
    child(attachments: :attachments) do
        attribute :filename, :url
        node(:id) { |a| a.id.to_s }
    end
    child(remark: :remark) do
        attribute :mark, :detail
    end
end
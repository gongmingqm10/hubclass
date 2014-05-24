collection @attachments

attribute :filename, :size, :url, :updated_at
node(:id) { |a| a.id.to_s }

object @note
attribute :title, :content
node(:note_id) {|n| n.id.to_s}
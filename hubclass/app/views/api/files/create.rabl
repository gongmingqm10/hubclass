object @attachment

attribute :filename, :size, :url
node(:id) { |a| a.id.to_s }
class Note < Portfolio
  field :share, type: Boolean, default: true
  field :tags, type: Array, default: []
  field :type, type: String, default: 'note'
  validates_inclusion_of :type, in: %w(note discussion attachment guide)

end
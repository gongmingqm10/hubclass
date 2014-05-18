class Note < Portfolio
  field :share, type: Boolean, default: true
  field :tags, type: Array, default: []

end
class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state, type: String, default: 'initial'
  field :participants, type: Hash, default: {}


  validates_inclusion_of :state, in: %w(initial created remark preview)

  embedded_in :assignment

end
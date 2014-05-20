class Assignment < Portfolio
  field :expiration, type: Date
  field :is_answer, type: Boolean, default: false
  embeds_one :workflow
end
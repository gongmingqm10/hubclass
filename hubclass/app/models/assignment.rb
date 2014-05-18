class Assignment < Portfolio
  field :expiration, type: Date
  embeds_one :workflow
end
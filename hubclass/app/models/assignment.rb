class Assignment < Note
  field :expiration, type: Date
  embeds_one :workflow
end
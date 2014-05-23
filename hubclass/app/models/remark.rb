class Remark
  include Mongoid::Document
  include Mongoid::Timestamps

  field :mark, type: String
  field :detail, type: String

  embedded_in :assignment

end
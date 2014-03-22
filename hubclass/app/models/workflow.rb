class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps


  embedded_in :assignment

end
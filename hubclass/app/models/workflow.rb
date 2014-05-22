class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state, type: String, default: 'preparation'
  field :participants, type: Hash, default: {}


  validates_inclusion_of :state, in: %w(preparation remark preview)

  embedded_in :assignment

  def operate_permissions
    participants.inject({}) do |result, (userid, homeworkid)|
      result[userid] ||= {}
      result[userid]['submittable'] = submittable?(userid)
      result
    end
  end


  def process_to_publish

  end

  def process_to_submit

  end

  def process_to_remark

  end

  def submittable?(userid)
    if participants[userid] && Assignment.find(participants[userid]).workflow.state != 'preparation'
      false
    else
      true
    end
  end

end
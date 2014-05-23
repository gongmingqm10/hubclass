class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps

  field :state, type: String, default: 'preparation'
  field :participants, type: Hash, default: {}


  validates_inclusion_of :state, in: %w(preparation remark preview)

  embedded_in :assignment

  #TODO to recalculate the submit number!!
  def submit_number
    participants.inject(0) do |result, (user_id, homework_id)|
      result ||= 0
      result = result + 1 if homework_id
    end
  end

  def operate_homework(user_id)
    if submittable?(user_id)
      return 'preparation'
    elsif remarkable?(user_id)
      return 'remark'
    else
      return 'finish'
    end
  end

  def operate_status
    participants.inject([]) do |result, (user_id, homework_id)|
      result ||= []
      user = User.find(user_id)
      result.push(
          {
              id: user_id,
              username: user.username,
              status: operate_homework(user_id)
          }
      )
    end
  end

  def submittable?(user_id)
    if participants[user_id] && Assignment.find(participants[user_id]).workflow.state != 'preparation'
      false
    else
      true
    end
  end

  def remarkable?(user_id)
    assignment = Assignment.find(participants[user_id])
    if assignment && !assignment.remark
      true
    else
      false
    end
  end

end
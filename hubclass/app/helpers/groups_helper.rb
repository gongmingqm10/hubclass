module GroupsHelper
  def get_record(group, member)
    if group.records && group.records[member.id.to_s]
      {vote: group.records[member.id.to_s]["vote"] || 0, absence: group.records[member.id.to_s]["absence"] || 0}
    else
      {vote: 0, absence: 0}
    end
  end
end
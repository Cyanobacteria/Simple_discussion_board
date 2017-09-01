module ApplicationHelper

  def last_update_post_of_group(id)
    group = Group.find(id).posts
    if group.count == 0
      return "目前沒有文章"
    else
      group.order('updated_at').last.title
    end 
  end

  def show_time(id)
    time = Time.now
    group = Group.find(id).posts
    if group.count == 0
      return "目前沒有文章"
    else
      time_distance = "#{((time - group.order('updated_at').last.updated_at) / 3600).round(1)} 小時前"
      time_updated = "#{group.order('updated_at').last.updated_at}"
      output = time_updated + "(" + time_distance + ")"
      output
    end 
  end
  




end

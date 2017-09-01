module ApplicationHelper
=begin
  def last_updated_post_of_group(id)
    group = Group.find(id).posts
    if group.count == 0
      return "目前沒有文章"
    else
      group.order('updated_at').last.title
    end 
  end

  def show_time_group(id)
    time = Time.now
    group = Group.find(id).posts
    if group.count == 0
      return "目前沒有文章"
    else
     #寫一個把超過24小時換成天 30天以上換成月+天 
      time_distance = "#{((time - group.order('updated_at').last.updated_at) / 3600).round(1)} 小時前"
      time_updated = "#{group.order('updated_at').last.updated_at}"
      output = time_updated + "(" + time_distance + ")"
      output
    end 
  end
  def last_created_post_of_group(id)
    group = Group.find(id).posts
    if group.count == 0
      return "目前沒有文章"
    else
      group.order('created_at').last.title
    end 
  end
=end

  def sort_tool(id , option1, option2 )
    case option1

      when "group" 

        case option2
 
          when "created_at"

            group = Group.find(id).posts
            if group.count == 0
              return "目前沒有文章"
            else
              group.order('created_at').last.title
            end
 
          when "updated_at"

            group = Group.find(id).posts
            if group.count == 0
              return "目前沒有文章"
            else
              group.order('updated_at').last.title
            end 

          when "time_distance"

            time = Time.now
            group = Group.find(id).posts
            if group.count == 0
              return "目前沒有文章"
            else
            #寫一個把超過24小時換成天 30天以上換成月+天 
              time_distance = "#{((time - group.order('updated_at').last.updated_at) / 3600).round(1)} 小時前"
              time_updated = "#{group.order('updated_at').last.updated_at}"
              output = time_updated + "(" + time_distance + ")"
              output
            end 
          end
   
      end
  end


end

module ApplicationHelper

  def sort_tool(id , option1, option2 )
   # id 對應 group本身的id
   # option1 目前只有"group" 之後post and discussion 有排序需要的時候再作進來
   # option2 group index頁面需要的各種功能
    case option1
      when "group" 
        posts_of_group = Group.find(id).posts
        #如果一個版沒有文章也就沒有排序，直接回傳沒有文章
        return "目前沒有文章" if group.count == 0
        case option2
          when "created_at"
            #給出最後create的post的title
            posts_of_group.order('created_at').last.title
          when "updated_at"
            #給出最後update的post的title
            posts_of_group.order('updated_at').last.title
          when "time_distance"
            #算出最近update的post的時間距離現在已經過了多久
            time_now = Time.now
            #找工具來重寫
            time_of_last_post = posts_of_group.order('updated_at').last.updated_at
            time_distance = "#{((time_now - time_of_last_post) / 3600).round(1)} 小時前"
            time_updated = "#{group.order('updated_at').last.updated_at}"
            output = time_updated + "(" + time_distance + ")"
            output 
          end
      end
  end


end

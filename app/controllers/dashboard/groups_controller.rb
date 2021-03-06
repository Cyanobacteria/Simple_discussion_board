class Dashboard::GroupsController < Dashboard::DashboardController
   
  def index
   @groups = Group.all
   #顯示所有group 並印出相應的show edit destroy 
   #有按鈕連結到new來新增 group  
  end

  def show
    #show出對應的group 並顯示所有該group底下的post
   #一樣要能夠新增post並有show edit destroy
  end

  def new
   @group = Group.new
   #表單 新增頁面
   #自製from
  end

  def create
   @group = Group.new(user_params)
   @group.user_id = current_user.id
   if @group.save
     redirect_to dashboard_groups_path
     puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
   end
   #新增動作本身
  end

  def edit
    @group = Group.find(params[:id]) 
  end

  def update
    @group = Group.find(params[:id]) 
    
    if @group.update(user_params)
      redirect_to dashboard_groups_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    
    if @group.destroy
      puts "刪除成功"
      redirect_to dashboard_groups_path
    end
    #搞清楚render redirect_to 的用法
    #手刻的過程 可以熟悉各種細節
  end

  
  def user_params
    params.require(:group).permit(:name, :describe)
  end


end

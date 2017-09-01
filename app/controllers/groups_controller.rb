class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user
  before_action :is_current_user?, :only => [:edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def show_by_user
    @groups = Group.where(user_id: current_user.id)
   
  end

  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
#北七喔 是user 跟 group建立多對多
#又不是group 跟 post多對多 

    @posts = @group.posts.each.reverse_each
    if current_user.profile == nil
      user = current_user
      Profile.create(:user_id => user.id, :name => user.email, :age => nil, :location => nil, :gender => nil)
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = @user
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
    #確定編輯後的id一定是編輯者本人
    @group.user = @user
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
  end

  def quit
  end



  private
    # Use callbacks to share common setup or constraints between actions.

    def set_group
      @group = Group.find(params[:id])
    end

    def is_current_user?      
      if current_user != @group.user
        redirect_to groups_path
      end
    end

    def set_current_user
     @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def group_params
      params.require(:group).permit(:user_id, :name, :describe)
    end

end

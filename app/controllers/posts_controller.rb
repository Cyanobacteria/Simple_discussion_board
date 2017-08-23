class PostsController < ApplicationController
  #順序不能反喔 跟private裡面的結構有關係 
  before_action :authenticate_user!
  before_action :set_group, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_current_user?, :only => [:edit, :update, :destroy]
  #before_action :find_discussions_belongs_to_post, :only => [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.each.reverse_each
    if current_user.profile == nil
      user = current_user
      Profile.create(:user_id => user.id, :name => user.email, :age => nil, :location => nil, :gender => nil)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   
    @discussions = @post.discussions.all 
    #用來在post的show頁面直接新增discussion
    @discussion = Discussion.new
    @group = @post.group
 
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @group = @post.group
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    #設定為user_id只能是創立者的不能自己設定
    @post.user = current_user
    @post.group = @group   
    #respond_to do |format|
      
      if @post.save
      #  format.html { redirect_to @post, notice: 'Post was successfully created.' }    
       redirect_to group_path(@group)
       # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    #respond_to do |format|
      @group = @post.group
      
      if @post.update(post_params)
       redirect_to group_path(@group)
       # format.html { redirect_to @post, notice: 'Post was successfully updated.' }
       # format.json { render :show, status: :ok, location: @post }
      else
       # format.html { render :edit }
       # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
   # end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
      @group = @post.group
    respond_to do |format|
      format.html { redirect_to group_path(@group.id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_group 
      @group = Group.find(params[:format])
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def find_discussions_belongs_to_post      
      @discussions = @post.discussions.all 
    end

    def is_current_user?      
      if current_user.id != @post.user_id
        redirect_to posts_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content)
    end
end

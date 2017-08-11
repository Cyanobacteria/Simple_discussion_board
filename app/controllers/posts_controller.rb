class PostsController < ApplicationController
  #順序不能反喔 跟private裡面的結構有關係 
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_current_user?, :only => [:edit, :update, :destroy]
  before_action :find_discussions_belongs_to_post, :only => [:show]

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
    #用來在post的show頁面直接新增discussion
    @discussion = Discussion.new 
  end

  # GET /posts/new
  def new
    @post = Post.new
    @group = Group.find(params[:format])
    puts "______"
    puts params
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @group = Group.find(params[:format])
    @post = Post.new(post_params)
    #設定為user_id只能是創立者的不能自己設定
    @post.user_id = current_user.id
    @post.group_id = @group.id    
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def find_discussions_belongs_to_post    
      
     a = @discussions = @post.discussions.all 
     a.each do |aa|
       #aa.each do |bb|
        puts "黑嘿嘿" 
        puts aa
       #end 
     end
      #要寫一個面對空值時候的判斷
#     puts @discussions[0].content
 #    puts "dffadsf"
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

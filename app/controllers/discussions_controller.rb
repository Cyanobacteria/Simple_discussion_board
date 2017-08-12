class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :is_current_user?, :only => [:edit, :update, :destroy]
  before_action :set_post, :only => [:create, :update, :destroy] 
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)
    #這邊少了一些東西 上面的params設計上應該要從post而來所以它應該要有post_id傳入
    #這個部份未解決需要補齊
    @discussion.post = @post
    @discussion.user_id = current_user.id
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to post_path(@post), notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { redirect_to post_path(@post) }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end      
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to post_path(@post), notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def set_post
      @post =Post.find(params[:post_id])
    end

    def is_current_user?      
      if current_user.id != @discussion.user_id
         redirect_to posts_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
 
    def discussion_params
      params.require(:discussion).permit(:post_id, :user_id, :content)
    end
end

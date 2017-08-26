class PublicController < ApplicationController

  def groups
    @groups = Group.all
  end
 
  def group
    @group = Group.find(params[:id])
    @posts = Post.where(:group_id => params[:id])
  end

  def post
    @post = Post.find(params[:post_id])
    @discussions = Discussion.where(:post_id => params[:post_id])
  end


end

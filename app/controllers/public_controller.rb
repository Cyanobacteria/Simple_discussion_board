class PublicController < ApplicationController

  def groups
    @groups = Group.all
  end
 
  def group
    @group = Group.find(params[:id])
    @posts = Post.where(:group_id => params[:id])
  end


end

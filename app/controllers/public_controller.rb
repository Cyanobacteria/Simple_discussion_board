class PublicController < ApplicationController

  def groups
    @groups = Group.all
  end

end

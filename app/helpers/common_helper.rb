
module CommonHelper
       
  def if_user_profile_nil_do
    user = current_user
    if user.profile == nil
      Profile.create(:user_id => user.id, :name => user.email)
    
    end
  end


end

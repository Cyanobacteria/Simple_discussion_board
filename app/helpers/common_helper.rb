
module CommonHelper
       
  def if_user_profile_nil_do
    #user = current_user
    if current_user.profile == nil
      Profile.create(:user_id => current_user.id, :name => current_user.email)
    
    end
  end


end

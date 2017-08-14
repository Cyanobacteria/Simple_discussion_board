require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  def set_params
    @params = {:id => "1", :post_id => "1"}
  end

  test "should get edit page" do
    get edit_post_discussion_path(id: "1", post_id: "1")
    assert_response :success 
    
  end
    



  
 










end

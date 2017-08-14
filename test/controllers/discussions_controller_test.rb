require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discussion = discussions(:one)
  end



    


  test "should get edit" do
    get edit_discussion_url(@discussion)
    assert_response :success
  end

  
 










end

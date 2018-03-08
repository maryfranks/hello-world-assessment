require "test_helper"

describe SessionsController do

  test "user can sign out" do
    # skip
    delete session_url(:martine)
    assert_redirected_to root_url
  end

end

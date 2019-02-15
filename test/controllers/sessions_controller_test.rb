require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_response :success
		post login_path, params: { session: { email: "", email: "" } }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
  end

	test "login with valid information" do
		get login_path
		assert_response :success
		post login_path, params: { session: { email: "example@railstutorial.org", email: "123456" } }
		assert_template 'sessions/new'
		# assert_template 'users/#{@current_user.id}'
	end

end

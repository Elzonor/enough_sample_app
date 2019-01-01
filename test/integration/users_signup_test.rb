require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "Invalid signup information" do
		get signup_path
		assert_no_difference "User.count" do
			post signup_path, params: { user: { name: "", email: "user@invalid", password: "xxx", password_confirmation: "yyy" } }
		end
		assert_template 'users/new'
		assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
		assert_select 'form[action="/signup"]'
	end

	# test "Valid signup information" do
	# 	get signup_path
	# 	assert_difference "User.count" do
	# 		post signup_path, params: { user: { name: "Foo Baz", email: "foobaz@example.com", password: "111111", password_confirmation: "11111" } }
	# 	end
	# 	assert_template user_path
	# end

end

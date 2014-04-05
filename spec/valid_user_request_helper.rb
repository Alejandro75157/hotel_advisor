module ValidUserRequestHelper
  def sign_in_as_a_valid_user
    @user||= create(:user)
    post_via_redirect user_session_path, 'user[username]' => @user.username, 'user[password]' => @user.password
  end
end
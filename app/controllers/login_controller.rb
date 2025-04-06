class LoginController < ApplicationController
  def login
  end

  def user_login
  end

  def logout
    redirect_to root_path
  end
end

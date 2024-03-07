class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def list_users
  end

end

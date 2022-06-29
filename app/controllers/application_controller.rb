class ApplicationController < ActionController::Base
  before_action :init

  def init
    @user = User.first
  end

  def current_user
    @user
  end
end

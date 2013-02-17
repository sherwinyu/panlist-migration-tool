class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter RubyCAS::Filter
  before_filter :current_user

  #so we can use current_user in the views
  helper_method :current_user

  def current_user
    session[:cas_user]
  end

end

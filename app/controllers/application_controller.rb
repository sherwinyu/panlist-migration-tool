class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ruby_cas_filter
  before_filter :current_user

  #so we can use current_user in the views
  helper_method :current_user

  def ruby_cas_filter
    RubyCAS::Filter unless session[:cas_user]
  end

  # returns current user as a string; no memoization!
  def current_user
    session[:cas_user]
  end

  def admins
    %w[alb64, sy23]
  end

end

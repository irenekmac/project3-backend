class ApplicationController < ActionController::Base

  before_action :fetch_user

  def fetch_user
    # Check if the session[:user_id] is set, and also make sure it
    # contains a valid (current) user ID

    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    # Delete this session (clear the ID from the session hash)
    # if the ID did not return a valid user
    unless @current_user.present?
      session[:user_id] = nil
    end

  end

  def check_if_logged_in
    # Show pages can ONLY be seen by logged-in users
    redirect_to login_path unless @current_user.present?
  end

  def check_if_admin
    #
    redirect_to login_path unless @current_user.present? && @current_user.admin?
  end

end #fetch_user

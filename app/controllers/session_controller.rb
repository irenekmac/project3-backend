class SessionController < ApplicationController

  def new
  end

  def create
    # See if the email entered actually exists in the 'users' create_table
    user = User.find_by email: params[:email]

    # Did we find a user, and if we did, is the password correct?
      if user.present? && user.authenticate(params[:password])
        # succesful login

        session[:user_id] = user.id

        redirect_to user_path(user.id) #go to show page (/users/10 or whatever ID)

      else
        # failed login (wrong credentials)
        flash[:error] = 'Invalid email or password'
        redirect_to login_path # show the form again

    end

  end #create

  def destroy
    session[:user_id] = nil #This logs out the user
    redirect_to login_path
  end


end

class SessionsController < ApplicationController
    def new
        
    end

    
  
    def create   
      @user = User.find_by(username: params[:session][:username])
      if @user 
          log_in(@user)
          current_user()
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_to root_url
      else
        # Create an error message.
        flash.now[:danger] = 'wrong username' # Not quite right!
        render 'new'
      end
    end


    def destroy
        signout() if current_user() != nil
        redirect_to root_url
    end

end

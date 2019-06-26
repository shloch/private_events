class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        flash[:info] = "Account succesfully created"
        redirect_to root_url
      else
        render 'new'
      end
  end


  def show 
      @user = User.find(params[:id])
      @created_events = @user.created_events.paginate(page: params[:page], :per_page => 15)    
      @upcoming_events = @user.upcoming_events
      @prev_events = @user.previous_events    
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                  :password_confirmation)
    end

    
end

class ApplicationController < ActionController::Base
    
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def current_user?(user)
        user == current_user()
    end
    
    def current_user=(user)
        @current_user = user
    end

    def signout
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    

end

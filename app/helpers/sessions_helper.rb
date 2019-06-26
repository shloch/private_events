module SessionsHelper
    def current_user
        if (user_id = session[:user_id]) #its really an equal sign
          @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
          #raise       # The tests still pass, so this branch is currently untested.
          user = User.find_by(id: user_id)
          if user && user.authenticated?(:remember, cookies[:remember_token])
            log_in(user)
            @current_user = user
          end
        end
    end

    def log_in(user)
        session[:user_id] = user.id
    end


    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to signin_url
        end
    end

    def logged_in?
        !current_user.nil?
    end
end

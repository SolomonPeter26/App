
class SessionsController < ApplicationController
    def create
        if user = User.authenticate(params[:username])
           session[:user_id]= user.id
               
           redirect_to users_path, :notice => "Logged in successfully"
           
        else
            flash.now[:alert] = "Invalid Login"
            render :action => 'new'
        end
    end
    
    def destroy
        reset_session
        redirect_to root_path, :notice => "You were successfully logged out"
        
    end
end

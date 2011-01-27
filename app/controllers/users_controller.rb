class UsersController < ApplicationController
  
   def show
     @user = User.find(params[:id])
     logger.debug "User: #{@user}"
     @title = @user.name
   end

   def new
     @user = User.new
     @title = "Sign up"
   end
  
   def create
      logger.debug(params[:user].to_s)
      logger.debug("User name: #{params[:user][:name]}")
      @user = User.new(params[:user])
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      if @user.save
        # Handle a successful save.
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        @title = "Sign up"
        @user.password = ""
        @user.password_confirmation = ""
        render 'new'
      end
   end

end

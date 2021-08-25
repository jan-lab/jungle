# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController

  #Add a before_filter to any controller that you want to secure. This will force user's to login before they can see the actions in this controller. The routes for this controller were added to the routes.rb
  #Compass instruction: For now, don't restrict any pages from access. Visitors and Users can view any page and perform the same actions.
  # before_filter :authorize

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct.
  #   if user && user.authenticate(params[:password])
  #     # Save the user id inside the browser cookie. This is how we keep the user 
  #     # logged in when they navigate around our website.
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #   # If user's login doesn't work, send them back to the login form.
  #     redirect_to '/login'
  #   end
  # end

  # in your SessionsController
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end


class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:email] == "admin"
      adm = Admin.find_by_username(params[:email])
      if adm && adm.authenticate(params[:password])
        session[:admin_id] = adm.id
        redirect_to admins_url('index'), notice: "Admin Logged in!"
      end
    elsif params[:email] =~ /@/
      user = Passenger.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to passengers_url('index'), notice: "Logged in!"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

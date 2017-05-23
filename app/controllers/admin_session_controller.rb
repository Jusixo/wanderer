class AdminSessionController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    admin = Admin.find_by(email: email)
    if admin && admin.authenticate(password)
      session[:admin_id] = admin.id
      redirect_to root_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path
  end
end

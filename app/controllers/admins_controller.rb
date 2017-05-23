class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id

      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end

end

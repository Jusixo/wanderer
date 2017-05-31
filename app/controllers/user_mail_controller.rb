class UserMailController < ApplicationController
  def send_mail()
    favorites = Favorite

    NotificationsMailer.favorited_mail(favorites, current_user).deliver_now
    redirect_to root_path
  end
end

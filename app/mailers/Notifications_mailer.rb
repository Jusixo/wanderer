class NotificationsMailer < ApplicationMailer
  def favorite

    @user = current_user
    @favorite = favorite.all

    mail(to: @user.email, subject: 'Thank you for attending our event!')
  end
end

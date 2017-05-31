class NotificationsMailer < ApplicationMailer
  def favorited_mail(favorites, user)
    @user = user
    @favorites = favorites.find_by(params[:id])

    mail(to: @user.email, subject: 'Thank you for attending our event!')
  end
end

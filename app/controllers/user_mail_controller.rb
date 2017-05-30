def send_mail
  @parameters = Model.get_parameters
  NotificationsMailer.name_of_action(@parameters).deliver
  # redirect code here
end

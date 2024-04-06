class NotificationFromAdminJob < ApplicationJob
  # どこのキューに割り当てる
  queue_as :default

  def perform(msg)
    # Do something later
    User.all.each do |user|
      NotificationFromAdminMailer.notify(user, msg).deliver_later
    end
  end
end

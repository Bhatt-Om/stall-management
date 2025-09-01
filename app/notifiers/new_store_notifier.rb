# To deliver this notification:
#
# NewStoreNotifier.with(record: @post, message: "New post").deliver(User.all)

class NewStoreNotifier < ApplicationNotifier
  required_param :building, :message

    deliver_by :fcm do |config|
    config.credentials = Rails.application.credentials.fcm.to_h
    Rails.logger.info config.credentials
    config.device_tokens = -> {
      recipient.notification_tokens.where(platform: :FCM).pluck(:token)
    }
    config.json = ->(device_token) {
        {
          message: {
            token: device_token,
            notification: {
              title: "Someone liked your hike!"
              },
            data: {
              path: buildings_path(params[:building])
            }
          }
        }
      }
   end
end

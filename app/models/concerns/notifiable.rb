module Notifiable
  extend ActiveSupport::Concern

  included do
    has_one :notification, as: :notifiable, dependent: :destroy
    belongs_to :author, class_name: "User"

    after_create_commit -> {
      broadcast_prepend_to "notification_stream",
        partial: "notifications/notification",
        locals: { notification: notification, classes: "notification new" },
        target: "messages"
    }
  end
end

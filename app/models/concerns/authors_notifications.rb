module AuthorsNotifications
  extend ActiveSupport::Concern

  included do
    has_many :comment_notifications, through: :comments, source: "notification"
    has_many :change_notifications, through: :recorded_changes,
      source: "notification"
  end

  def notifications
    Notification.
      joins(<<-SQL.squish).
        FULL OUTER JOIN "comments" ON
          "notifications"."notifiable_id" = "comments"."id"
        FULL OUTER JOIN "changes" ON
          "notifications"."notifiable_id" = "changes"."id"
      SQL
      where(
        comments: { author_id: self.id }).or(self.class.where(
        changes: { author_id: self.id }),
      )
  end
end

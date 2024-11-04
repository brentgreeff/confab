class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  has_many :comments, foreign_key: "author_id", dependent: :destroy

  has_many :recorded_changes, class_name: "Change", foreign_key: "author_id",
    dependent: :destroy

  has_many :comment_notifications, through: :comments, source: "notification"
  has_many :change_notifications, through: :recorded_changes,
    source: "notification"

  def notifications
    Notification.
      joins(<<-SQL).
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

  after_commit -> { notifications.touch_all }, on: :update

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

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
    comment_notifications + change_notifications
  end

  after_commit -> { notifications.each(&:touch) }, on: :update

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

class User < ApplicationRecord
  has_secure_password

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :sessions, dependent: :destroy

  has_many :comments, foreign_key: "author_id", dependent: :destroy

  has_many :recorded_changes, class_name: "Change", foreign_key: "author_id",
    dependent: :destroy

  include AuthorsNotifications

  after_commit -> { notifications.touch_all }, on: :update
end

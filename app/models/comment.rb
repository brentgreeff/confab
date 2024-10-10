class Comment < ApplicationRecord
  validates :text, presence: true

  has_one :notification, as: :notifiable, dependent: :destroy

  before_validation -> {
    self.build_notification(message: self.text)
  }, on: :create
end

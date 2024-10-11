class Comment < ApplicationRecord
  validates :text, presence: true

  include Notifiable

  before_validation -> {
    self.build_notification(message: self.text)
  }, on: :create
end

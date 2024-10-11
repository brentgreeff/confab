class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, class_name: "User"
  has_one :notification, as: :notifiable, dependent: :destroy

  before_validation -> {
    self.build_notification(message: self.text)
  }, on: :create
end

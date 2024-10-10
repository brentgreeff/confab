class Change < ApplicationRecord
  default_scope -> { order(created_at: :asc) }

  belongs_to :auditable, polymorphic: true

  has_one :notification, as: :notifiable, dependent: :destroy

  before_validation -> {
    self.build_notification(
      message: ChangeMessageBuilder.from(changes: self.json),
    )
  }, on: :create
end

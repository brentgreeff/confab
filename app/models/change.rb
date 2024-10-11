class Change < ApplicationRecord
  default_scope -> { order(created_at: :asc) }

  belongs_to :auditable, polymorphic: true

  include Notifiable

  before_validation -> {
    self.build_notification(
      message: ChangeMessageBuilder.from(changes: self.json),
    )
  }, on: :create
end

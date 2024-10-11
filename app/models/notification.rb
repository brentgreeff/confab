class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :notifiable, polymorphic: true

  def authored_by
    notifiable.author
  end
end

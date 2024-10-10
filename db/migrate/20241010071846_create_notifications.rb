class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :notifiable, polymorphic: true, null: false, type: :uuid
      t.string :message

      t.timestamps
    end
  end
end

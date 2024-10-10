class CreateChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :changes, id: :uuid do |t|
      t.references :auditable, polymorphic: true, null: false, type: :uuid
      t.jsonb :json, null: false, default: {}

      t.timestamps
    end
  end
end

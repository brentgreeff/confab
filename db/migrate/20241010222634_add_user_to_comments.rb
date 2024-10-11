class AddUserToComments < ActiveRecord::Migration[8.0]
  def change
    change_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users },
        type: :uuid
    end
  end
end

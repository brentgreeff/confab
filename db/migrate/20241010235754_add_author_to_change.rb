class AddAuthorToChange < ActiveRecord::Migration[8.0]
  def change
    change_table :changes do |t|
      t.references :author, null: false, foreign_key: { to_table: :users },
        type: :uuid
    end
  end
end

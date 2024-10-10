class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :text, null: false

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end

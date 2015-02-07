class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :description, null: false
      t.string :link, null: false

      t.timestamps null: false
    end
  end
end

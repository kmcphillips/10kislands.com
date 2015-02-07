class AddPositionToCard < ActiveRecord::Migration
  def change
    add_column :cards, :position, :integer
    add_index :cards, :position
  end
end

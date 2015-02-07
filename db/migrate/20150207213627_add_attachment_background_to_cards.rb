class AddAttachmentBackgroundToCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :cards, :background
  end
end

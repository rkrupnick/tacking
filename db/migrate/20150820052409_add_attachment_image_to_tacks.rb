class AddAttachmentImageToTacks < ActiveRecord::Migration
  def self.up
    change_table :tacks do |t|

      t.attachment :image

    end
  end

  def self.down

    remove_attachment :tacks, :image

  end
end

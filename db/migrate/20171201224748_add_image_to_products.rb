class AddImageToProducts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :products, :image
  end
end

class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :product_id, :integer
      t.column :user_id, :integer
      t.column :rating, :integer
      t.column :comments, :text

      t.timestamps
    end
  end
end

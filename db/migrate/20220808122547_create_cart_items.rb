class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :amount,  null: false
      

      t.timestamps
    end
  end
end

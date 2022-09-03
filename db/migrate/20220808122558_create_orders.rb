class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :shipping_postal_code,     null: false
      t.string :shipping_address,         null: false
      t.string :shipping_name,            null: false
      t.integer :postage,                 null: false
      t.integer :billing_amount,           null: false
      t.integer :payment_method,          null: false,  default: 0
      t.integer :is_active,               null: false,  default: 0
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end

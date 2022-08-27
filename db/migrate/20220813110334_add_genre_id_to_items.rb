class AddGenreIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :genre_id, :integer
    create_table :addresses do |t|
      
      t.string :name,             null: false
      t.string :postal_code,      null: false
      t.string :address,          null: false

      t.timestamps
    end
  end
end

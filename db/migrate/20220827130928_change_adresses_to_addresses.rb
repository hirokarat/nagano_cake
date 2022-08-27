class ChangeAdressesToAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_table :adresses,:addresses
    
  end
end

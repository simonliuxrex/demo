class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :kyc_level
      t.float :balance

      t.timestamps
    end
  end
end

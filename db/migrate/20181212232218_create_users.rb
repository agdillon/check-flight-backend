class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :password # not sure if we need this since we will be storing hashed pw
      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end

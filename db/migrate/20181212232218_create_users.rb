class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :firstName
      t.string :lastName
      t.boolean :isExaminer, default: false
      t.text :bio
      t.integer :rates

      t.timestamps
    end
  end
end

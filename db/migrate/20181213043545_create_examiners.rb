class CreateExaminers < ActiveRecord::Migration[5.2]
  def change
    create_table :examiners do |t|
      t.text :bio
      t.integer :rates
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

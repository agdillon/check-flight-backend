class CreateAvails < ActiveRecord::Migration[5.2]
  def change
    create_table :avails do |t|
      t.datetime :date
      t.boolean :morning
      t.boolean :afternoon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end

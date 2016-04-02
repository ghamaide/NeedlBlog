class AddPictureUrLs < ActiveRecord::Migration
  def change
    add_column :articles, :pictures, :string, array: true
  end
end

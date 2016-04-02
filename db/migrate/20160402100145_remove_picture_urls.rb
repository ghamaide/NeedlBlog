class RemovePictureUrls < ActiveRecord::Migration
  def change
    remove_column :articles, :pictures, :string, array: true
  end
end

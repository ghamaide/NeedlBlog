class AddInfosToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :type, :string
    add_column :articles, :summary, :text
    add_column :articles, :views, :integer, null: false, default: 0
    add_column :articles, :likes, :integer, null: false, default: 0
  end
end

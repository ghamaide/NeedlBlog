class FixArticleColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :type, :model
  end
end

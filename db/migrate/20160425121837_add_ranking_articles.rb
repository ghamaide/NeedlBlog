class AddRankingArticles < ActiveRecord::Migration
  def change
    add_column :articles, :rank, :integer
  end
end

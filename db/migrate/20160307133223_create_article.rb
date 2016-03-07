class CreateArticle < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :author, null: false
    	t.text :content, null: false

    	t.timestamps
    end
  end
end

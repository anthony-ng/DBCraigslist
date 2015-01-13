class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :email
      t.integer :price
      t.string :article_key
      t.integer :category_id

      t.timestamps
    end
  end
end

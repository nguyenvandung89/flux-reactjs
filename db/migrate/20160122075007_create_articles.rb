class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.boolean :checked
      t.string :content

      t.timestamps null: false
    end
  end
end

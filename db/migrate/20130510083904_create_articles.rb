class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.string :aurthor_name
      t.integer :user_id

      t.timestamps
    end
  end
end

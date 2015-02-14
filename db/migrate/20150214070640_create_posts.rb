class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author_name
      t.datetime :released_date
      t.boolean :is_released

      t.timestamps
    end
  end
end

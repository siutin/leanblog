class AddSlugToPost < ActiveRecord::Migration

  def self.up
    add_column :posts,:slug, :string
    add_index :posts, :slug, unique: true
  end

  def self.down
    remove_index :posts, :slug if index_exists?(:posts, :slug)
    remove_column :posts, :slug if column_exists?(:posts, :slug)
  end

end

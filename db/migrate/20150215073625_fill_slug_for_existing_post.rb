class FillSlugForExistingPost < ActiveRecord::Migration

  def self.up
    Post.find_each(&:save)
  end

  def self.down
    Post.find_each do|post|
      post.slug = nil
      post.save!(validate:false)
    end
  end

end

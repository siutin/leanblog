class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  scope :is_released, -> {where(is_released: true)}

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def slug_candidates
    :title
  end

  validates_presence_of :title, :author_name, :content
end

class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :is_released, -> {where(is_released: true)}

end

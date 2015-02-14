class Post < ActiveRecord::Base

  scope :is_released, -> {where(is_released: true)}

end

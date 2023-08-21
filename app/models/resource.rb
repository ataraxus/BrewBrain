class Resource < ApplicationRecord
  belongs_to :ingredient
  has_many_attached :attachments
  has_many_attached :images
end

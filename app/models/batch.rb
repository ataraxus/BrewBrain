class Batch < ApplicationRecord
  has_many_attached :images
  has_many_attached :attachments
end

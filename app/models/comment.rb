class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reference, polymorphic: true
  has_many_attached :attachments
end

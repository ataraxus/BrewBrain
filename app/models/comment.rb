class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reference, polymorphic: true
  has_many_attached :attachments

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "reference_id", "reference_type", "text", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["reference", "user"]
  end
end

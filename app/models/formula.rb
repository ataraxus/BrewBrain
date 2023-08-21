class Formula < ApplicationRecord
  has_many_attached :images
  has_many_attached :attachments

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

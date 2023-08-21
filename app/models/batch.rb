class Batch < ApplicationRecord
  has_many_attached :images
  has_many_attached :attachments
  has_many :batch_steps
  accepts_nested_attributes_for :batch_steps

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "description", "finished", "id", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

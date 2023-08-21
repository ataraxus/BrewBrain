class BatchStep < ApplicationRecord
  belongs_to :resource
  belongs_to :batch

  def self.ransackable_attributes(auth_object = nil)
    ["batch_id", "created_at", "description", "id", "name", "resource_id", "updated_at"]
  end
end

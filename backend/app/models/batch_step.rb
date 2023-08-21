class BatchStep < ApplicationRecord
  belongs_to :resource
  belongs_to :batch
  belongs_to :formula_step

  def self.ransackable_attributes(auth_object = nil)
    ["batch_id", "created_at", "description", "id", "name", "resource_id", "updated_at", "step_number"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["batch", "resource", "formula_step"]
  end
end

class BatchStep < ApplicationRecord
  belongs_to :asset, optional: true
  belongs_to :batch
  belongs_to :formula_step

  def self.ransackable_attributes(auth_object = nil)
    ["batch_id", "created_at", "description", "id", "name", "asset_id", "updated_at", "step_number"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["batch", "asset", "formula_step"]
  end
end

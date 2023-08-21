class ExecutedStep < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  belongs_to :batch_step

  def self.ransackable_attributes(auth_object = nil)
    ["batch_id", "created_at", "executed_at", "id", "name", "batch_step_id", "state", "updated_at", "user_id"]
  end
end

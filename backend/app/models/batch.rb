class Batch < ApplicationRecord
  enum state: {planned: 0, in_progress: 1, incubating: 2, bottled: 3, failed: 4}

  has_many :batch_steps, dependent: :destroy

  accepts_nested_attributes_for :batch_steps, allow_destroy: true

  assignable_values_for :state do
    states = Formula.states.keys
    case state_was
    when "planned"
      states = ["planned","failed", "in_progress"]
    when "in_progress"
      states = ["in_progress", "failed", "bottled"]
    when "incubating"
      states = ["incubating", "failed", "bottled"]
    end
    states
  end

  has_many_attached :images
  has_many_attached :attachments

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "description", "finished", "id", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

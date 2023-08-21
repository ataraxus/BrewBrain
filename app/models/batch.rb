class Batch < ApplicationRecord
  enum state: {open: 0, closed: 1}

  has_many :batch_steps, dependent: :destroy

  accepts_nested_attributes_for :batch_steps

  has_many_attached :images
  has_many_attached :attachments

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "description", "finished", "id", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

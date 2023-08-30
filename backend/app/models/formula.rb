class Formula < ApplicationRecord
  enum state: {planned: 0, in_progress: 1, closed: 3, production: 4}

  has_many :formula_steps, dependent: :destroy
  has_many :formula_ingredients, dependent: :destroy

  belongs_to :formula_category, optional: true

  has_many_attached :images
  has_many_attached :attachments

  accepts_nested_attributes_for :formula_steps, allow_destroy: true
  accepts_nested_attributes_for :formula_ingredients, allow_destroy: true

  assignable_values_for :state do
    states = Formula.states.keys
    case state_was
    when "planned"
      states = ["planned","closed", "in_progress"]
    when "in_progress"
      states = ["in_progress", "closed", "production"]
    end
    states
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "state", "updated_at", "formula_category_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["formula_category"]
  end
end

ActiveAdmin.register Resource do
  filter :name
  filter :state
  filter :description
  filter :lot_number
  filter :amount_in_kg
  filter :ingredient

  permit_params :name, :state, :description, :lot_number, :amount_in_kg, :ingredient_id
end

ActiveAdmin.register Batch do
  filter :name
  filter :description
  filter :state
  filter :finished
  filter :amount

  permit_params :name, :description, :state, :finished, :amount
end

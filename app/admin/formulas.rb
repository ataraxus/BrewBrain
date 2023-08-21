ActiveAdmin.register Formula do
  filter :name
  filter :description
  filter :state

  permit_params :name, :description, :state
end

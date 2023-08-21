ActiveAdmin.register Ingredient do
  filter :name
  filter :description
  filter :type
  
  permit_params :name, :description, :type
end

ActiveAdmin.register Ingredient do
  menu priority: 3

  filter :name
  filter :description
  filter :type

  permit_params :name, :description, :type
end

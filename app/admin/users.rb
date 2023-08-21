ActiveAdmin.register User do
  menu priority: 2
  permit_params :name
end

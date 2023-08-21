ActiveAdmin.register BatchStep do
  permit_params :name, :description, :resource_id, :batch_id
end

ActiveAdmin.register BatchStep do
  belongs_to :batch
  permit_params :name, :description, :material_id, :batch_id
end

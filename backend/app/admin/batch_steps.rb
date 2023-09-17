ActiveAdmin.register BatchStep do
  belongs_to :batch
  permit_params :name, :description, :asset_id, :batch_id
end

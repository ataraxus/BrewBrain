ActiveAdmin.register Comment do
  filter :user_id
  filter :text
  filter :reference_type
  filter :reference_id

  permit_params :user_id, :text, :reference_type, :reference_id
end

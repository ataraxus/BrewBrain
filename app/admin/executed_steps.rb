ActiveAdmin.register ExecutedStep do
  permit_params :name, :state, :executed_at, :user_id, :batch_id, :process_step_id
end

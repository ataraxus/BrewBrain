ActiveAdmin.register Batch do
  filter :name
  filter :description
  filter :state
  filter :finished
  filter :amount

  permit_params :name, :description, :state, :finished, :amount, :step_number

  sidebar "Batch Details", only: [:show, :edit] do
    ul do
      li link_to "Batch Steps", admin_batch_batch_steps_path(resource)
    end
  end
end

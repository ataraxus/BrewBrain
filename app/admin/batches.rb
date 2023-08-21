ActiveAdmin.register Batch do
  filter :name
  filter :description
  filter :state
  filter :finished
  filter :amount

  permit_params :name, :description, :state, :finished, :amount, batch_steps_attributes: [:name, :description, :step_number]

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :state
      f.input :finished
      f.input :amount
    end
    f.inputs do
      f.has_many :batch_steps, sortable: :step_number, sortable_start: 1 do |t|
        t.input :name
        t.input :description
      end
    end
    f.actions
  end

  sidebar "Batch Details", only: [:show, :edit] do
    ul do
      li link_to "Batch Steps", admin_batch_batch_steps_path(resource)
    end
  end
end

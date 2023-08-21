ActiveAdmin.register Batch do
  menu priority: 7

  filter :name
  filter :description
  filter :state
  filter :finished
  filter :amount

  permit_params :name, :description, :state, :finished, :amount,
    batch_steps_attributes: [:name, :description, :step_number],
    images: [],
    attachments: []

  show do
    attributes_table do
      row :name
      row :description
      row :state
      row :finished
      row :amount
      row :created_at
      row :updated_at
      row :images do
        div do
          batch.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end

      row :attachments do
        div do
          batch.attachments.each do |attachment|
            div do
              link_to attachment.filename, url_for(attachment)
            end
          end
        end
      end
    end

    active_admin_comments
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :state
      f.input :finished
      f.input :amount
      f.input :images, as: :file, input_html: {multiple: true}
      f.input :attachments, as: :file, input_html: {multiple: true}
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

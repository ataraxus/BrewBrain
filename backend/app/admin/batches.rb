ActiveAdmin.register Batch do
  menu priority: 7

  filter :name
  filter :description
  filter :state
  filter :finished
  filter :amount

  permit_params :name, :description, :state, :finished, :amount,
    batch_steps_attributes: [:id, :name, :description, :step_number, :formula_step_id, :asset_id, :_destroy],
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
            div do
              link_to "Delete", delete_attachment_batch_path(attachment_id: img.id), data: {confirm: "Are you sure?"}
            end
          end
        end
      end

      row :attachments do
        div do
          batch.attachments.each do |attachment|
            div do
              span do
                link_to attachment.filename, url_for(attachment)
              end
              span do
                link_to "Delete", delete_attachment_batch_path(attachment_id: attachment.id), data: {confirm: "Are you sure?"}
              end
            end
          end
        end
      end
    end

    div do
      active_admin_form_for [:admin, asset], url: attach_image_batch_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Images" do
          f.input :images, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    div do
      active_admin_form_for [:admin, asset], url: attach_attachment_batch_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Attachment" do
          f.input :attachments, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    table_for batch.batch_steps, order_by: :step_number do
      column :name
      column :description
      column :asset
      column :formula_step
    end

    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :state
      f.input :finished
      f.input :amount
    end
    f.inputs do
      f.has_many :batch_steps, sortable: :step_number, sortable_start: 1, allow_destroy: true do |t|
        t.input :name
        t.input :description
        t.input :formula_step
        t.input :asset
      end
    end
    f.actions
  end

  member_action :attach_image, method: :post do
    asset.images.attach(params[:batch][:images])
    if asset.save
      redirect_to asset_path, notice: "Uploaded Image!"
    else
      redirect_to asset_path, notice: "Failed to upload!"
    end
  end

  member_action :attach_attachment, method: :post do
    asset.attachments.attach(params[:batch][:attachments])
    if asset.save
      redirect_to asset_path, notice: "Uploaded Attachment!"
    else
      redirect_to asset_path, notice: "Failed to upload!"
    end
  end

  member_action :delete_attachment do
    ActiveStorage::Attachment.find(params[:attachment_id]).purge_later
    redirect_to [:admin, asset], notice: "Attachment deleted!"
  end

  sidebar "Batch Details", only: [:show, :edit] do
    ul do
      li link_to "Batch Steps", batch_batch_steps_path(asset)
    end
  end
end

ActiveAdmin.register Material do
  menu priority: 4

  filter :name
  filter :state
  filter :description
  filter :lot_number
  filter :amount_in_kg
  filter :ingredient

  permit_params :name, :state, :description, :lot_number, :amount_in_kg, :ingredient_id,
    images: [],
    attachments: []

  show do
    attributes_table do
      row :name
      row :description
      row :lot_number
      row :amount_in_kg
      row :ingredient
      row :created_at
      row :updated_at

      row :images do
        div do
          material.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
            div do
              link_to "Delete", delete_attachment_material_path(attachment_id: img.id), data: {confirm: "Are you sure?"}
            end
          end
        end
      end

      row :attachments do
        div do
          material.attachments.each do |attachment|
            div do
              span do
                link_to attachment.filename, url_for(attachment)
              end
              span do
                link_to "Delete", delete_attachment_material_path(attachment_id: attachment.id), data: {confirm: "Are you sure?"}
              end
            end
          end
        end
      end
    end

    div do
      active_admin_form_for [:admin, resource], url: attach_image_material_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Images" do
          f.input :images, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    div do
      active_admin_form_for [:admin, resource], url: attach_attachment_material_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Attachment" do
          f.input :attachments, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :lot_number
      f.input :amount_in_kg
      f.input :ingredient
    end
    f.actions
  end

  member_action :attach_image, method: :post do
    resource.images.attach(params[:material][:images])
    if resource.save
      redirect_to resource_path, notice: "Uploaded Image!"
    else
      redirect_to resource_path, notice: "Failed to upload!"
    end
  end

  member_action :attach_attachment, method: :post do
    resource.attachments.attach(params[:material][:attachments])
    if resource.save
      redirect_to resource_path, notice: "Uploaded Attachment!"
    else
      redirect_to resource_path, notice: "Failed to upload!"
    end
  end

  member_action :delete_attachment do
    ActiveStorage::Attachment.find(params[:attachment_id]).purge_later
    redirect_to [:admin, resource], notice: "Attachment deleted!"
  end
end

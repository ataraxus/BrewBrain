ActiveAdmin.register Ingredient do
  menu priority: 3

  filter :name
  filter :description
  filter :ingredient_type

  permit_params :name, :description, :ingredient_type, images: [], attachments: []

  show do
    attributes_table do
      row :name
      row :description
      row :ingredient_type
      row :created_at
      row :updated_at
      row :images do
        div do
          ingredient.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
            div do
              link_to "Delete", delete_attachment_admin_ingredient_path(attachment_id: img.id), data: {confirm: "Are you sure?"}
            end
          end
        end
      end

      row :attachments do
        div do
          ingredient.attachments.each do |attachment|
            div do
              span do
                link_to attachment.filename, url_for(attachment)
              end
              span do
                link_to "Delete", delete_attachment_ingredient_path(attachment_id: attachment.id), data: {confirm: "Are you sure?"}
              end
            end
          end
        end
      end
    end

    div do
      active_admin_form_for [:admin, asset], url: attach_image_ingredient_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Images" do
          f.input :images, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    div do
      active_admin_form_for [:admin, asset], url: attach_attachment_ingredient_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
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
      f.input :ingredient_type
    end
    f.actions
  end

  member_action :attach_image, method: :post do
    asset.images.attach(params[:ingredient][:images])
    if asset.save
      redirect_to asset_path, notice: "Uploaded Image!"
    else
      redirect_to asset_path, notice: "Failed to upload!"
    end
  end

  member_action :attach_attachment, method: :post do
    asset.attachments.attach(params[:ingredient][:attachments])
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
end

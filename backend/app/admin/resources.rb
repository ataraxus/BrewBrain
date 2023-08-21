ActiveAdmin.register Resource do
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
          resource.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end

      row :attachments do
        div do
          resource.attachments.each do |attachment|
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
      f.input :lot_number
      f.input :amount_in_kg
      f.input :ingredient
      f.input :images, as: :file, input_html: {multiple: true}
      f.input :attachments, as: :file, input_html: {multiple: true}
    end
    f.actions
  end
end

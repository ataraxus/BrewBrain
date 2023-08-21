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
          end
        end
      end

      row :attachments do
        div do
          ingredient.attachments.each do |attachment|
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
      f.input :ingredient_type
      f.input :images, as: :file, input_html: {multiple: true}
      f.input :attachments, as: :file, input_html: {multiple: true}
    end
    f.actions
  end
end

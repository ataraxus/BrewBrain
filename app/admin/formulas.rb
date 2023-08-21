ActiveAdmin.register Formula do
  filter :name
  filter :description
  filter :state
  filter :formula_category

  permit_params :name, :description, :state, :formula_category_id,
    formula_steps_attributes: [:name, :description, :step_number],
    formula_ingredients_attributes: [:percentage, :ingredient_id, :index],
    images: []

  show do
    attributes_table do
      row :name
      row :description
      row :state
      row :formula_category
      row :created_at
      row :updated_at
      row :images do
        div do
          formula.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end
    end

    table_for formula.formula_steps, order_by: :step_number do
      column :name
      column :description
    end

    table_for formula.formula_ingredients, order_by: :index do
      column :percentage
      column :ingredient
    end

    active_admin_comments
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :state
      f.input :formula_category
      f.input :images, as: :file, input_html: {multiple: true}
      f.input :attachments, as: :file, input_html: {multiple: true}
    end
    f.inputs do
      f.has_many :formula_steps, sortable: :step_number, sortable_start: 1 do |t|
        t.input :name
        t.input :description
      end
    end
    f.inputs do
      f.has_many :formula_ingredients, sortable: :index, sortable_start: 1 do |t|
        t.input :percentage
        t.input :ingredient
      end
    end
    f.actions
  end

  sidebar "Formula Details", only: [:show, :edit] do
    ul do
      li link_to "Formula Steps", admin_formula_formula_steps_path(resource)
      li link_to "Formula Ingredients", admin_formula_formula_ingredients_path(resource)
    end
  end
end

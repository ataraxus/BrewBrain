ActiveAdmin.register Formula do
  menu priority: 6

  filter :name
  filter :description
  filter :state
  filter :formula_category

  permit_params :name, :description, :state, :formula_category_id,
    formula_steps_attributes: [:id, :name, :description, :step_number, :_destroy],
    formula_ingredients_attributes: [:id, :percentage, :ingredient_id, :index, :_destroy],
    images: [],
    attachments: []

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
            div do
              link_to "Delete", delete_attachment_formula_path(attachment_id: img.id), data: {confirm: "Are you sure?"}
            end
          end
        end
      end

      row :attachments do
        div do
          formula.attachments.each do |attachment|
            div do
              span do
                link_to attachment.filename, url_for(attachment)
              end
              span do
                link_to "Delete", delete_attachment_formula_path(attachment_id: attachment.id), data: {confirm: "Are you sure?"}
              end
            end
          end
        end
      end
    end

    div do
      active_admin_form_for [:admin, resource], url: attach_image_formula_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Images" do
          f.input :images, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
        end
      end
    end

    div do
      active_admin_form_for [:admin, resource], url: attach_attachment_formula_path, html: {multipart: true}, method: :post, builder: ActiveAdmin::FormBuilder do |f|
        f.semantic_errors
        f.inputs "Attach Attachment" do
          f.input :attachments, as: :file, input_html: {multiple: true}
          f.action :submit, label: "Upload"
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

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description
      f.input :state, collection: f.object.humanized_assignable_states.map { |s| [s.humanized, s.value] }
      f.input :formula_category
    end
    f.inputs do
      f.has_many :formula_steps, sortable: :step_number, sortable_start: 1, allow_destroy: true do |t|
        t.input :name
        t.input :description
      end
    end
    f.inputs do
      f.has_many :formula_ingredients, sortable: :index, sortable_start: 1, allow_destroy: true do |t|
        t.input :percentage
        t.input :ingredient
      end
    end
    f.actions
  end

  member_action :attach_image, method: :post do
    resource.images.attach(params[:formula][:images])
    if resource.save
      redirect_to resource_path, notice: "Uploaded Image!"
    else
      redirect_to resource_path, notice: "Failed to upload!"
    end
  end

  member_action :attach_attachment, method: :post do
    resource.attachments.attach(params[:formula][:attachments])
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

  member_action :create_batch, method: :post do
    batch = Batch.new
    batch.name = resource.name
    batch.state = :planned
    batch.description = params[:amount]
    resource.formula_steps.each do |formula_step|
      step = batch.batch_steps.build
      step.name = formula_step.name
      step.formula_step = formula_step
      step.resource = Resource.first
    end

    if batch.save
      redirect_to batch_path(batch)
    else
      logger.error "Error creating batch! #{batch.errors.inspect}"
    end
  end

  sidebar "Formula Details", only: [:show, :edit] do
    ul do
      li link_to "Formula Steps", formula_formula_steps_path(resource)
      li link_to "Formula Ingredients", formula_formula_ingredients_path(resource)
    end
  end

  sidebar "Create new Batch", only: [:show] do
    if resource.state == "production"
      render "formulas/create_new_batch_form", resource: resource
    end
  end
end

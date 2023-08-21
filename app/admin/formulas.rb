ActiveAdmin.register Formula do
  filter :name
  filter :description
  filter :state
  filter :formula_category

  permit_params :name, :description, :state, :formula_category

  sidebar "Formula Details", only: [:show, :edit] do
    ul do
      li link_to "Formula Steps", admin_formula_formula_steps_path(resource)
      li link_to "Formula Ingredients", admin_formula_formula_ingredients_path(resource)
    end
  end
end

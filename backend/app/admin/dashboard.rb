# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel I18n.t("dashboard.overview") do
          table_for [
            [User, admin_users_path],
            [Ingredient, admin_ingredients_path],
            [Resource, admin_resources_path],
            [FormulaCategory, admin_formula_categories_path],
            [Formula, admin_formulas_path],
            [Batch, admin_batches_path]
          ] do
            column(I18n.t("dashboard.name")) { |resource, link| link_to resource.model_name.human(count: resource.count).titleize, link }
            column(I18n.t("dashboard.count")) { |resource, link| resource.count }
          end
        end
      end
    end
  end
end

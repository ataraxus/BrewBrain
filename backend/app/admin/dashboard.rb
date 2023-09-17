# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel I18n.t("dashboard.overview") do
          table_for [
            [User, users_path],
            [Ingredient, ingredients_path],
            [Asset, assets_path],
            [FormulaCategory, formula_categories_path],
            [Formula, formulas_path],
            [Batch, batches_path]
          ] do
            column(I18n.t("dashboard.name")) { |resource, link| link_to resource.model_name.human(count: resource.count).titleize, link }
            column(I18n.t("dashboard.count")) { |resource, link| resource.count }
          end
        end
      end
    end
  end
end

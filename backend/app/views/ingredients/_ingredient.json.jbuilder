json.extract! ingredient, :id, :name, :description, :ingredient_type, :images, :attachments, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
json.images do
  json.array!(ingredient.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
json.attachments do
  json.array!(ingredient.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end

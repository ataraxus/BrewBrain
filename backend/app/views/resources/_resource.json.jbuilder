json.extract! resource, :id, :name, :state, :description, :lot_number, :amount_in_kg, :attachments, :images, :ingredient_id, :created_at, :updated_at
json.url resource_url(resource, format: :json)
json.attachments do
  json.array!(resource.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end
json.images do
  json.array!(resource.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end

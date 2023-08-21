json.extract! formula, :id, :name, :description, :state, :images, :attachments, :created_at, :updated_at
json.url formula_url(formula, format: :json)
json.images do
  json.array!(formula.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
json.attachments do
  json.array!(formula.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end

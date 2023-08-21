json.extract! batch, :id, :name, :description, :state, :finished, :amount, :images, :attachments, :created_at, :updated_at
json.url batch_url(batch, format: :json)
json.images do
  json.array!(batch.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
json.attachments do
  json.array!(batch.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end

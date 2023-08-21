json.extract! comment, :id, :user_id, :text, :reference_id, :reference_type, :attachments, :created_at, :updated_at
json.url comment_url(comment, format: :json)
json.attachments do
  json.array!(comment.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end

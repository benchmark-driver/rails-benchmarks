json.content format_content(@message.content)
json.created_at @message.created_at
json.updated_at @message.updated_at
json.author do
  json.name @message.creator.name.familiar
  json.email_address @message.creator.email_address_with_name
  json.url url_for(@message.creator, format: :json)
end

if current_user.admin?
  json.visitors calculate_visitors(@message)
end

json.comments do
  json.array!(@message.comments) do |comment|
    json.content comment.content
    json.created_at comment.created_at
  end
end

json.attachments do
  json.array!(@message.attachments) do |attachment|
    json.filename attachment.filename
    json.url url_for(attachment)
  end
end

json.array!(@posts) do |post|
  json.extract! post, :title, :content, :userName
  json.url post_url(post, format: :json)
end

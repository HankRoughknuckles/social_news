json.array!(@links) do |link|
  json.extract! link, :id, :link, :description, :user_id
  json.url link_url(link, format: :json)
end

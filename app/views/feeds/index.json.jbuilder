json.array! @posts do |post|
  json.id post.id
  json.content post.content
  json.posted_at post.created_at
  json.user do
    json.id post.user.id
    json.user_name post.user.user_name
  end
  json.likes post.likes.count
  json.liked post.liked_by?(current_user)
end

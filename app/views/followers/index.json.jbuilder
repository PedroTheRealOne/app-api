json.total @followers.count
json.current_user do
  json.id @current_user.id
  json.user_name @current_user.user_name
  json.bio @current_user.bio
  json.email @current_user.email
end
json.followers @followers do |follower|
  json.id follower.id
  json.user_name follower.user_name
end

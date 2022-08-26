json.total @followings.count
json.current_user do
  json.id current_user.id
  json.user_name current_user.user_name
end
json.followings @followings do |following|
  json.id following.id
  json.user_name following.user_name
end

json.total @followers.count
json.followers @followers do |follower|
  json.id follower.id
  json.user_name follower.user.user_name
end

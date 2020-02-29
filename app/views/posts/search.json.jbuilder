# json.array! @posts do |post|
#   json.id post.id
#   json.title post.title
#   json.content post.content
#   json.image post.image
#   json.time post.created_at
#   json.user_id post.user_id
#   json.name post.user.name
#   json.user_sign_in current_user
#   json.tag_name post.tag_list
#   json.likes post.likes_count
# end
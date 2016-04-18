json.extract! @comment, :id, :user_id, :article_id, :body, :created_at, :updated_at
json.user do
  json.email @comment.user.email
end

# la linea 1 es equivalente al bloque de linea 7 a 12
#  json.id         @comment.id
#  json.user_id    @comment.user_id
#  json.article_id @comment.article_id
#  json.body       @comment.body
#  json.created_at @comment.created_at
#  json.updated_at @comment.updated_at

class CommentSerializer < ActiveModel::Serializer
  attributes :content, :points, :username, :created_at, :id
  belongs_to :user
end

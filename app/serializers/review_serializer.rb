class ReviewSerializer < ActiveModel::Serializer
  attributes :body, :rating, :user, :movie, :id
end
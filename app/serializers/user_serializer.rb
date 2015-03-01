class UserSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :slug, :email, :name, :description, :company, :location
end

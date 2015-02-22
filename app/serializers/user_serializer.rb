class UserSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :uuid, :slug, :email, :name, :description, :company, :location
end

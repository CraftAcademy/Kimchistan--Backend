class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
end
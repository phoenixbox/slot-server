module V1
  class CreateSerializer < ActiveModel::Serializer
    attributes :access_token, :uuid
  end
end

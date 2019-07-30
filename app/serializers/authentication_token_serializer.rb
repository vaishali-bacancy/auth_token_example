class AuthenticationTokenSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :user_id
end

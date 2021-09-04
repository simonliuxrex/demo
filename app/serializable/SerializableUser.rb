# app/serializable/SerializableUser.rb
class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :balance

  # link :self do
  #   @url_helpers.api_user_url(@object.id)
  # end
end

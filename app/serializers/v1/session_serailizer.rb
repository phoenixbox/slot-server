module V1
  class SessionSerializer < ActiveModel::Serializer
    attributes  :access_token,
                :token_type,
                :id,
                :uuid,
                :email,
                :facebook_username,
                :facebook_display_name,
                :facebook_token

    def access_token
      object.access_token
    end

    def token_type
      'Bearer'
    end

    def id
      object.id
    end

    def uuid
      object.uuid
    end

    def email
      object.email
    end

    def facebook_username
      @options[:facebook_profile].username
    end

    def facebook_display_name
      @options[:facebook_profile].display_name
    end

    def facebook_token
      @options[:facebook_profile].token
    end
  end
end

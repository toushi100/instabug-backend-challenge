class V1::UserSerializer < V1::ApplicationSerializer
  fields :email, :sendbird_user_uuid, :sendbird_nickname, :sendbird_profile_url, :nmbr, :phone_number,
         :profile_picture_url,:full_name, :bio, :sendbird_access_token
end

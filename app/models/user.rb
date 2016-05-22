class User < ActiveRecord::Base
  validates  :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
    user = self.find_by(uid: auth_hash["info"].id, provider: auth_hash["provider"])
    if !user.nil?
      return user
    else
      user = User.new
      user.spotify_profile = auth_hash["info"]["external_urls"]["spotify"]
      user.uid = auth_hash["info"]["id"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      user.image = auth_hash["info"]["images"]
      if auth_hash["info"]["images"][0]
        user.image = auth_hash["info"]["images"][0]["url"]
      end
      if user.save
        return user
      else
        return nil
      end
    end
  end
end

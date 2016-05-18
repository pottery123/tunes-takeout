class User < ActiveRecord::Base
  validates :email, :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    # user = //something else here//
    # if !user.nil?
    #   return user that was found
    # else
    #   no user found, do something here
    user = User.new
    user.uid = auth_hash["info"]["uid"]
    user.provider = auth_hash["info"]["display_name"]
    user.name = auth_hash["info"]["name"]
    user.image = auth_hash["info"]["images"][0]["url"]
    if user.save
      return user
    else
      return nil
    end
  end
end

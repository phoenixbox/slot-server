class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable,
         :validatable,
         :recoverable,
         :trackable,
         :lockable

  after_create :update_access_token!

  # Validations
  validates :display_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_many :authentications

  def self.from_omniauth(params)
    password = Devise.friendly_token[0,20]
    user = User.create!({
      :email => params['profile']['email'],
      :display_name => params['profile']['name'],
      :uuid => "",
      :password => password,
      :password_confirmation => password
    })

    user.createAuthentication(params)
    user
  end

  def createAuthentication(params)
    auth = self.authentications.create({
      :uid => params['profile']['id'],
      :provider => params['provider'],
      :token => params['profile']['token'],
      :token_type => params['profile']['token_type'],
      :expiration => params['profile']['expiration']
    })

    createFacebookProfile(auth, params)
  end

  def createFacebookProfile(auth, params)
    FacebookProfile.create({
      :uid => params['profile']['id'],
      :username => params['profile']['username'],
      :display_name => params['profile']['name'],
      :email => params['profile']['email'],
      :raw => params['profile']['raw'],
      :token => auth.token,
      :authentication_id => auth.id
    })
  end

  private

  def update_access_token!
    # Do I have access to the original params? or do they need to be passed in?
    uuid = SecureRandom.base64
    self.uuid = uuid
    self.access_token = generate_access_token(uuid)
    save
  end

  def generate_access_token(uuid)
    loop do
      token = "#{uuid}:#{Devise.friendly_token}"
      break token unless User.where(access_token: token).first
    end
  end
end

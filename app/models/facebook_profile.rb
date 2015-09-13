class FacebookProfile < ActiveRecord::Base
  belongs_to :authentication, dependent: :destroy

  validates :uid, presence: true
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :authentication_id, presence: true
  validates :token, presence: true, uniqueness: true
end

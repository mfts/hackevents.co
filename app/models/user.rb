class User < ActiveRecord::Base
  before_create :generate_registration_confirmation_token
  has_secure_password
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/ }

  before_save :downcase_email

  has_many :memberships
  has_many :hackathons, :through => :memberships

  def downcase_email
    self.email = email.downcase
  end

  def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def follow_hackathon(hackathon)
    self.memberships.create(hackathon_id: hackathon.id)
  end

  def unfollow_hackathon(hackathon)
    self.memberships.where(hackathon_id: hackathon.id).destroy_all
  end

  def following?(hackathon)
    Membership.exists?(['user_id = ? AND hackathon_id = ?', self.id, hackathon.id])
  end

  private
  def generate_registration_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end

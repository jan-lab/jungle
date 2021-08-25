class User < ActiveRecord::Base
  # add has_secure_password. This is the line of code that gives our User model authentication methods via bcrypt.
  has_secure_password

  #validation (validating the required data is in the right form to create the user)
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false } #validates :email, confirmation: { case_sensitive: false }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :password, confirmation: { case_sensitive: true }

  #authentication (use has already been created)
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end

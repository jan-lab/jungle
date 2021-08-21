class User < ActiveRecord::Base
  # add has_secure_password. This is the line of code that gives our User model authentication methods via bcrypt.
  has_secure_password

end

class User < ActiveRecord::Base


  has_secure_password
  has_many :reviews

  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }

  def self.authenticate_with_credentials(email, password)
    if (email.strip.downcase! == :email.strip.downcase! && password == :password)
      true
    else
      false
    end
  end



end

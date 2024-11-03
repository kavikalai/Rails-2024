class User < ApplicationRecord
  attr_accessor :password, :old_password, :new_password, :confirm_password
  
  has_attached_file :avatar,
    :styles => { :original=> "125x125#"}

  validates :username, :presence => true, :uniqueness => true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP , message: :must_be_a_valid_email_address} 
  validate :password, on: :create
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/png", "image/jpg"] }
  validates_attachment_size :avatar, :less_than => 2.megabytes, :unless => Proc.new {|m| m[:avatar].nil? }

  before_save :create_hash_password

  def create_hash_password
    self.salt = random_string(8) if self.salt == nil
    self.hashed_password = Digest::SHA1.hexdigest(self.salt + self.password) unless self.password.nil?
    if self.new_record?
      self.is_first_login = true
    end
  end

  def authenticate(passwd)
    hashed_password == Digest::SHA1.hexdigest(salt + passwd)
  end

  def random_string(len)
    randstr = ""
    chars = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    len.times { randstr << chars[rand(chars.size - 1)] }
    randstr
  end

  def profile_img
    avatar? ? avatar.url : "profile-img.jpg"
  end

end

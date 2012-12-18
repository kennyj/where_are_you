class User < Owner
  validates_presence_of :name, :email
  has_many :contributors
end

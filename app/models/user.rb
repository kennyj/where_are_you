class User < Owner
  validates_presence_of :name
  has_many :contributors
end

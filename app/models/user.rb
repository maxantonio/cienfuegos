class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts

  validates :name, presence: true,
                   length: { maximum: 40 }
end

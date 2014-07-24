class User < ActiveRecord::Base
  include Clearance::User

  validates :name, presence: true,
                   length: { maximum: 40 }
end

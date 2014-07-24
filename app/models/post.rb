class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true

  def body_truncated
    if self.body.length > 100
      "#{self.body[0..100]} ..."
    else
      self.body
    end
  end

end

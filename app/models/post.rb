class Post < ActiveRecord::Base

  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :body, presence: true,
                   length: { minimum: 20 }

  def body_truncated
    if self.body.length > 100
      "#{self.body[0..100]} ..."
    else
      self.body
    end
  end

end

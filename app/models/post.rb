class Post < ActiveRecord::Base
  belongs_to :user

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

  def body_preview
    if self.body.length > 400
      "#{self.body[0..400]} ..."
    else
      self.body
    end
  end

end

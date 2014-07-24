class Post < ActiveRecord::Base

  def body_truncated
    if self.body.length > 100
      "#{self.body[0..100]} ..."
    else
      self.body
    end

  end

end

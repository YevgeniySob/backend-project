class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report

  def username
    self.user.username
  end


end

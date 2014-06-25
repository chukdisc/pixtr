class Comment < ActiveRecord::Base
  def self.recent
    order(created_at: :asc)
  end
end

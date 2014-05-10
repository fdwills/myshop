module PrevNext
  extend ActiveSupport::Concern

  def prev index_type = 'all'
    if index_type.eql? 'all'
      self.class.released.where(["id < ?", self.id]).last
    else
      self.class.where(["user_id = ? and id < ?", self.user_id, self.id]).last
    end
  end

  def next index_type = 'all'
    if index_type.eql? 'all'
      self.class.released.where(["id > ?", self.id]).first
    else
      self.class.where(["user_id = ? and id > ?", self.user_id, self.id]).first
    end
  end
end

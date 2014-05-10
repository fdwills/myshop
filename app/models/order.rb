class Order < ActiveRecord::Base
  include PrevNext
  belongs_to :user

  scope :recent , -> { order('created_at DESC') }
end

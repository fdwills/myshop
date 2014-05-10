class Good < ActiveRecord::Base
  include PrevNext
  # 0 for release, 1 for draft
  ST_RELEASED = 0
  ST_DRAFT    = 1

  has_many :orders

  mount_uploader :image_1, AvatarUploader
  mount_uploader :image_2, AvatarUploader
  mount_uploader :image_3, AvatarUploader
  scope :recent , -> { order('created_at DESC') }
  scope :released, -> { where(state: ST_RELEASED) }

  validates :title, presence: true, length: { maximum: 255 }
  validates_inclusion_of :state, :in => [ST_RELEASED, ST_DRAFT]

  def released?
    self.state == ST_RELEASED
  end
end

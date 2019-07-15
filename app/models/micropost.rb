class Micropost < ApplicationRecord
  belongs_to :user
  scope :order_by_created_time, ->{order(created_at: :desc)}
  scope :user_owner, ->(user_id){where "user_id = ?", user_id}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.content_max}
  validate  :picture_size

  private

  def picture_size
    return unless picture.size > Settings.file_size.megabytes
    errors.add :picture, t("picture_size")
  end
end

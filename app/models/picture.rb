class Picture < ApplicationRecord
  validates :title, presence: true
  # add 180701 画像のアップ実装時、以下1行をマスク解除
  # mount_uploader :image, ImageUploader
end

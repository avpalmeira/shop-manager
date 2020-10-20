class Product < ApplicationRecord
  include Rails.application.routes.url_helpers
  validates :name, presence: true

  has_one_attached :photo

  def get_photo_url
    if self.photo.attached?
      url_for(self.photo)
    else
      ""
    end
  end
end

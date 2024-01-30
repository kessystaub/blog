class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_one_attached :image
  # has_rich_text :image_body

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
   []
  end

  def image_as_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_limit: [270, 270]).processed
  end
end

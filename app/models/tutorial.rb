class Tutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews

  has_attached_file :tutorial_img, styles: { tutorial_index: "250x350>", tutorial_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :tutorial_img, content_type: /\Aimage\/.*\z/
end

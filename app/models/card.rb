class Card < ActiveRecord::Base
  EMBED_LINK_REGEX = /\Ahttps?:\/\/(www\.)?(youtube\.com|youtu.be)\//

  acts_as_list

  validates :link, presence: true, format: {with: EMBED_LINK_REGEX, message: "is not a valid video link"}
  validates :description, presence: true

  has_attached_file :background, styles: {
    thumb: ["32x32#", :png]
  }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  scope :sorted, ->{ order(position: :asc) }

end

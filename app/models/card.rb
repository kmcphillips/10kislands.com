class Card < ActiveRecord::Base
  EMBED_LINK_REGEX = /\Ahttps?:\/\/(www\.)?(youtube\.com|youtu\.be|vimeo\.com)\//

  acts_as_list

  validates :link, presence: true, format: {with: EMBED_LINK_REGEX, message: "is not a valid video link"}
  validates :description, presence: true

  has_attached_file :background, styles: {
    thumb: ["200x200#", :png],
    small: ["400x300#", :jpg],
    big: ["800x600#", :jpg]
  }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  scope :sorted, ->{ order(position: :asc) }

  def title
    if description.present?
      description.gsub("\n", " ")
    end
  end

end

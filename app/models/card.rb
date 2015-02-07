class Card < ActiveRecord::Base
  EMBED_LINK_REGEX = /\Ahttps?:\/\/(www\.)?(youtube\.com|youtu.be)\//

  validates :link, presence: true, format: {with: EMBED_LINK_REGEX, message: "is not a valid video link"}
  validates :description, presence: true

end

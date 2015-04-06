module AdminHelper
  def error_messages(form)
    render "shared/error_messages", object: form.object if form.object.errors.any?
  end

  def card_image_preview(card, opts={})
    opts = {alt: card.title, style: "width: 200px; height: 200px; margin: 10px;", class: "img-thumbnail"}.merge(opts)

    image_tag(card.background.url(:thumb), opts)
  end

  def higher_arrow_for_index(index)
    case index
    when 0, 2, 3, 5
      "up"
    when 1
      "left"
    when 4
      "right"
    end
  end

  def lower_arrow_for_index(index)
    case index
    when 1, 2, 4, 5
      "down"
    when 3
      "left"
    when 0
      "right"
    end
  end
end

module AdminHelper
  def error_messages(form)
    render "shared/error_messages", object: form.object if form.object.errors.any?
  end

  def card_image_preview(card, opts={})
    opts = {alt: card.title, style: "width: 200px; height: 200px;"}.merge(opts)

    image_tag(card.background.url(:thumb), opts)
  end
end

module AdminHelper
  def error_messages(form)
    render "shared/error_messages", object: form.object if form.object.errors.any?
  end
end

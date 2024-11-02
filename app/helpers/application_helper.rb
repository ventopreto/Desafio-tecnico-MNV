module ApplicationHelper
  def error_tag(model, attribute)
    return "" unless model.errors.has_key?(attribute)

    message = model.errors[attribute].first
    css_class = options[:class] || "error-message"
    content_tag :div, message, class: css_class
  end
end

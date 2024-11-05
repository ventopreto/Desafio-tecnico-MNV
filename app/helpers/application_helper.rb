# frozen_string_literal: true

module ApplicationHelper
  def error_tag(model, attribute)
    return unless model.errors.key? attribute

    content_tag :div, model.errors[attribute].first, class: "error-message"
  end
end

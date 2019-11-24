# frozen_string_literal: true
module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    resource.errors.full_messages
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end

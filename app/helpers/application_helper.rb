# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level # rubocop:disable Style/HashLikeCase
    when 'notice'
      'alert alert-info'
    when 'success'
      'alert alert-success'
    when 'error'
      'alert alert-danger'
    when 'alert'
      'alert alert-danger'
    end
  end
end

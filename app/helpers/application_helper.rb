# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level # rubocop:disable Style/HashLikeCase
    when 'notice'
      'alert alert-info alert-dismissible fade show'
    when 'success'
      'alert alert-success alert-dismissible fade show'
    when 'error'
      'alert alert-danger alert-dismissible fade show'
    when 'alert'
      'alert alert-danger alert-dismissible fade show'
    end
  end
end

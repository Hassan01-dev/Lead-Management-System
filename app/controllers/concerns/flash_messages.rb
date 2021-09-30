# frozen_string_literal: true

module FlashMessages
  def flash_message(msg, path, type = 'notice')
    flash[type] = msg
    redirect_to path
  end
end

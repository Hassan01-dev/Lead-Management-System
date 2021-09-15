# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Hassan Raza <hassan.raza@devsinc.com>'
  layout 'mailer'
end

# README

Lead Management Engine

This product is aimed at managing sales leads and their process in an organization.

* Ruby version
  > 2.7.2

* System dependencies
  * Active Storage
  * Cloudinary
  * Figaro
  * Devise
  * Bootstrap
  * rubocop

* Dev Server
    In Order to rub in the development server, you need to perform following steps
    Run these commands
    `bundle`
    `rails db:migrate` to run all the migrations.
    You need to run the Seed file in order to create super admin for the first time so, you can run the application smoothly. In order to perform this you need to type this
    `rails db:seed`

* Configuration
  * Rubocop configuration settings
  * SMTP settings
    You need to configure your credentials for the gmail in order to send the mails with different id. By default the mail is sent through admin account.
    'hassan.raza@devsinc.com'
  * Cloudinary credentials
    You need to configure credentials for the cloudinary account, if you want to use your own personal account.

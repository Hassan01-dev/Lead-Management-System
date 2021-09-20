# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@default_password = '123456'

User.create!([{ user_name: 'Hassan Admin', email: 'hassan.raza@devsinc.com', user_role: 'admin',
                password: 'Hassan' },
              { user_name: 'Hassan Raza', email: 'hassanraza0140@gmail.com', user_role: 'BD',
                password: @default_password },
              { user_name: 'Test User 1', email: 'testuser1@gmail.com', user_role: 'BD',
                password: @default_password },
              { user_name: 'Noah Ryan', email: '2noahryan@gmail.com', user_role: 'TM',
                password: @default_password }])

4.times do |serial|
  email = "testuser#{serial + 2}@gmail.com"
  User.create!(user_name: Faker::Name.name, email: email, user_role: 'TM', password: @default_password)
end

10.times do |serial|
  email = "testuser#{serial + 6}@gmail.com"
  User.create!(user_name: Faker::Name.name, email: email, user_role: 'engineer', password: @default_password)
end

@default_client_contact = '01234567890'
8.times do |serial|
  email = "testclient#{serial + 1}@gmail.com"
  Lead.create!(lead_name: "Test Lead #{serial + 1}", lead_type: 'interview', platform_used: 'Linux',
               user_id: Random.new.rand(1..3), client_name: Faker::Name.name,
               client_address: Faker::Address.full_address, client_email: email,
               client_contact: @default_client_contact)
end

7.times do |serial|
  email = "testclient#{serial + 9}@gmail.com"
  Lead.create!(lead_name: "Test Lead #{serial + 9}", lead_type: 'test', platform_used: 'Linux',
               user_id: Random.new.rand(1..3), client_name: Faker::Name.name,
               client_address: Faker::Address.full_address, client_email: email,
               client_contact: @default_client_contact)
end

15.times do
  Phase.create!(phase_type: 'interview', start_date: (Date.current + rand(0..5)), end_date: (Date.current + rand(10..15)), # rubocop:disable Layout/LineLength
                lead_id: rand(1..15), user_id: rand(4..8), is_accepted: true,
                assigned_engineer: Array.new(rand(0..5)) { rand(9..18) })
end

10.times do
  Phase.create!(phase_type: 'test', start_date: (Date.current + rand(0..5)), end_date: (Date.current + rand(10..15)),
                lead_id: rand(1..15), user_id: rand(4..8), is_accepted: true,
                assigned_engineer: Array.new(rand(0..5)) { rand(9..18) })
end

30.times do |serial|
  Comment.create!(comment_text: "Test Comment #{serial + 1}", user_id: rand(1..18), phase_id: rand(1..25))
end

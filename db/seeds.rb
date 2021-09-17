# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@default_password = '123456'
User.create([{ user_name: 'Hassan Raza', email: 'hassanraza0140@gmail.com', user_role: 'admin',
               password: 'Hassan' },
             { user_name: 'Hassan', email: 'hassan.raza@devsinc.com', user_role: 'BD',
               password: @default_password },
             { user_name: 'Test User 1', email: 'testuser1@gmail.com', user_role: 'BD',
               password: @default_password },
             { user_name: 'Noah Ryan', email: '2noahryan@gmail.com', user_role: 'TM',
               password: @default_password },
             { user_name: 'Test User 2', email: 'testuser2@gmail.com', user_role: 'Tm',
               password: @default_password },
             { user_name: 'Test User 3', email: 'testuser3@gmail.com', user_role: 'TM',
               password: @default_password },
             { user_name: 'Test User 4', email: 'testuser4@gmail.com', user_role: 'TM',
               password: @default_password },
             { user_name: 'Test User 5', email: 'testuser5@gmail.com', user_role: 'TM',
               password: @default_password },
             { user_name: 'Test User 6', email: 'testuser6@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 7', email: 'testuser7@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 8', email: 'testuser8@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 9', email: 'testuser9@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 10', email: 'testuser10@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 11', email: 'testuser11@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 12', email: 'testuser12@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 13', email: 'testuser13@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 14', email: 'testuser14@gmail.com', user_role: 'engineer',
               password: @default_password },
             { user_name: 'Test User 15', email: 'testuser15@gmail.com', user_role: 'engineer',
               password: @default_password }])

@default_client_contact = '12345678900'
Lead.create([{ lead_name: 'Test Lead 1', lead_type: 'interview', user_id: 1, client_name: 'Test Client 1',
               client_address: 'Test Address 1', client_email: 'clientemail1@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 2', lead_type: 'interview', user_id: 2, client_name: 'Test Client 2',
               client_address: 'Test Address 2', client_email: 'clientemail2@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 3', lead_type: 'interview', user_id: 1, client_name: 'Test Client 3',
               client_address: 'Test Address 3', client_email: 'clientemail3@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 4', lead_type: 'interview', user_id: 1, client_name: 'Test Client 4',
               client_address: 'Test Address 4', client_email: 'clientemail4@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 5', lead_type: 'interview', user_id: 2, client_name: 'Test Client 5',
               client_address: 'Test Address 5', client_email: 'clientemail5@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 6', lead_type: 'test', user_id: 1, client_name: 'Test Client 6',
               client_address: 'Test Address 6', client_email: 'clientemail6@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 7', lead_type: 'test', user_id: 2, client_name: 'Test Client 7',
               client_address: 'Test Address 7', client_email: 'clientemail7@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 8', lead_type: 'test', user_id: 1, client_name: 'Test Client 8',
               client_address: 'Test Address 8', client_email: 'clientemail8@gmail.com',
               client_contact: @default_client_contact },
             { lead_name: 'Test Lead 9', lead_type: 'test', user_id: 2, client_name: 'Test Client 9',
               client_address: 'Test Address 9', client_email: 'clientemail9@gmail.com',
               client_contact: @default_client_contact }])


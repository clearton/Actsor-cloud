# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create_with(full_name: 'Gloria Alarcon Morales', password: 'password', password_confirmation: 'password').find_or_create_by(email: 'gloria.alarconmorale@udc.edu')
User.create_with(full_name: 'Bruce Mendoza Naca', password: 'password', password_confirmation: 'password').find_or_create_by(email: 'bruce.mendozanaca@udc.edu')
User.create_with(full_name: 'Byunggu Yu', password: 'password', password_confirmation: 'password').find_or_create_by(email: 'byu@udc.edu')
User.create_with(full_name: 'Junwhan Kim', password: 'password', password_confirmation: 'password').find_or_create_by(email: 'junwhan.kim@udc.edu')

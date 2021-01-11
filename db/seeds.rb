# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Baca inbox
EmailUser.where(email_id: 5, user_id: 1, status: 'inbox')
# Baca sent
Email.where(user_id: 2 , status: 'sent')
# Baca Draft
Email.where(user_id: 2, status: 'draft')
# Baca Trash
b = [] << Email.where(user_id: 1, status: 'trash') << EmailUser.where(user_id: 2, status: 'trash')
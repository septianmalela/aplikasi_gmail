# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#EmailUser

	<%= f.email_field :recipients, :multiple => true, name: "email_users[subject][]", class: 'form-control col-md-5' %>
  <%= f.email_field :recipients, :multiple => true ,class: 'form-control' %>
	
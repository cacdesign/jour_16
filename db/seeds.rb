# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


User.destroy_all
Category.destroy_all
Article.destroy_all
Comment.destroy_all



# - Je crée mes users 
10.times do |index|
	u = User.create(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email)
	p "L'utilisateur #{u.last_name} a été crée"
end

# - Je crée mes catégories
5.times do |index|
	c = Category.create(name: Faker::Color.color_name)
	p "La catégorie #{c.name} a été crée"
end


# - Je crée mes articles en les rattachant au premier User et première catégorie
10.times do |index|
	a = Article.create(title: Faker::Book.title, content: Faker::Book.publisher)
	u = User.first
	c = Category.first
	a.user = u
	a.category = c
	a.save
	p "Le livre #{a.title} de l'auteur #{u.last_name} avec le contenu #{a.content} a été crée"
end


# - Je crée mes commentaires en les rattachant au premier User et premièr article
15.times do |index|
	com = Comment.create(content: Faker::HarryPotter.quote)
	u = User.first
	a = Article.first
	com.user = u
	com.article = a
	com.save
	p "Le comment #{com.content} de l'auteur #{com.user.last_name} sur l'article #{com.article.title} a été crée"
end

# - Je crée mes likes en les rattachant au premier User et premier article
15.times do |index|
	l = Like.create
	u = User.first
	a = Article.first
	l.user = u
	l.article = a
	l.save
	p "Un like de l'auteur #{l.user.last_name} sur l'article #{l.article.title} a été crée"
end
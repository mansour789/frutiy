# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'test@test.com', password '123456', name: 'Mansour Almohsen', location: 'Riyadh', admin: true)
User.create(email: 'other@user.com', password '123456', name: 'Mohammed Mansour', location: 'Riyadh', admin: true)

Product.create(name: 'Family basket', price: 39, pictuer: 'b1.jpg', discreption: 'A rich basket filled with fresh fruit from the farm suitable for four people', user_id: 2)
Product.create(name: 'Be Organic', price: 59, pictuer: 'b2.jpg', discreption: 'This wonderful basket has organic and fresh fruit suitable for 4 people', user_id: 2)
Product.create(name: 'Fruits & Vegetables', price: 88, pictuer: 'b6.jpg', discreption: 'A variety of fresh vegetables and fruits suitable for four people', user_id: 2)
Product.create(name: 'Imported fruits', price: 55, pictuer: 'b3.jpg', discreption: 'A variety of imported fruits coming from Europe ', user_id: 2)
Product.create(name: 'Large basket', price: 79, pictuer: 'b7.jpg', discreption: 'This basket is designed for a large family with fresh fruit suitable for seven people', user_id: 2)
Product.create(name: 'Fresh vegetables', price: 29, pictuer: 'v4.jpg', discreption: 'A fresh vegetable package has more than six varieties of delicious vegetable', user_id: 2)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
	id: 1,
	email: 'admin@gmail.com',
	password: 'password'
	)

User.create!(
	name: "鈴木太郎",
	gender: "male",
	age: "25",
	email: "test@test.com",
	password: "password",
	)

User.create!(
	name: "山田花子",
	gender: "female",
	age: "22",
	email: "test1@test.com",
	password: "password",
	)

RamenNoodle.create(
	id: 1,
	user_id: 1,
	title: "麺堂　稲葉",
	address: "茨城県古河市大山560-1",
	name: "鶏黒つけめん",
	price: "920",
	body: "美味しいです！",
	image: open("./app/assets/images/IMG_3018.png")
	)

RamenNoodle.create(
	id: 2,
	user_id: 2,
	title: "らーめん壱輝",
	address: "茨城県古河市大堤617",
	name: "こて味噌らーめん",
	price: "820",
	body: "美味しいです！",
	image: open("./app/assets/images/IMG_3097.png")
	)

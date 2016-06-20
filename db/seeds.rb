User.create! name: "Huong Nguyen",
             email: "huongnguyen@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password
end

User.create! name:  "Admin",
             email: "admin@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true

Category.create! name: "English",
                 description: "Learning English"

Category.create! name: "Japanese",
                 description: "Learning Japanese"

Category.create! name: "Russian",
                 description: "Learning Russian"

Category.create! name: "Italian",
                 description: "Learning Italian"

Category.create! name: "Chinese",
                 description: "Learning Chinese"

Word.create! name: "Banana",
             category_id: 1
Word.create! name: "Apple",
             category_id: 1
Word.create! name: "Orange",
             category_id: 1
Word.create! name: "Tomato",
             category_id: 1
Word.create! name: "Potato",
             category_id: 1
Word.create! name: "Mango",
             category_id: 1
Word.create! name: "Lemon",
             category_id: 1
Word.create! name: "Watermelon",
             category_id: 1
Word.create! name: "Pinapple",
             category_id: 1

Word.create! name: "バナナ",
             category_id: 2
Word.create! name: "林檎",
             category_id: 2
Word.create! name: "オレンジ",
             category_id: 2
Word.create! name: "トマト",
             category_id: 2
Word.create! name: "ポテト",
             category_id: 2
Word.create! name: "マンゴー",
             category_id: 2
Word.create! name: "レモン",
             category_id: 2
Word.create! name: "スイカ",
             category_id: 2
Word.create! name: "パイナップル",
             category_id: 2

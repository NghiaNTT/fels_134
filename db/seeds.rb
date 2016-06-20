User.create! name: "Huong Nguyen",
             email: "huongnguyen@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true

(1..10).each do |n|
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

(1..5).each do |category_id|
  Category.create(name: "Category #{category_id}", description: "Learning Category #{category_id}" )
end

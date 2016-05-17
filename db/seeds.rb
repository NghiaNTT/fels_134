User.create! name:  "Huong Nguyen",
             email: "huongnguyen@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: false

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

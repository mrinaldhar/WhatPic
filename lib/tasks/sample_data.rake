namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Mrinal Dhar",
                 email: "mrinal.dhar@me.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 username: "exampleusr", 
                 admin:true,
                 score:0 )
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      username = "exampleusr-#{n+1}"
      score = 0
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   username: username,
                   score: score)
    end
  end
end
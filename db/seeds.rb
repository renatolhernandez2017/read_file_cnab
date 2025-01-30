puts "apagando dados antigos..."
User.destroy_all

puts "Criando user Admin"
user_1 = User.create!(name: "Caique Viana", email: "caiquelimav@gmail.com", password: "123123", role: "admin")
user_2 = User.create!(name: "Renato Hernandez", email: "renatolhernandez@gmail.com", password: "123123", role: "admin")

puts "FIM!"

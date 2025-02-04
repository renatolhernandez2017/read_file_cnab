puts "apagando dados antigos..."
User.destroy_all

puts "Criando user Admin"
User.create!(name: "bycoders", email: "bycoders@gmail.com", password: "123456", role: "admin", hash_link: "9X6S")

puts "FIM!"

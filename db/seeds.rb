#Create Users
user = User.create(name: "Vinicius da Silva", email: "vssilva233@gmail.com", password: "secret123", score: 100)
user = User.create(name: "Henrique Januário", email: "riquejanuario@gmail.com", password: "secret123", score: 120)

#Populate works, work_types, cities
UpdateDatabase.call

#Create PromoCodes
PromoCode.create(description: "Desconto na Saraiva ao comprar 2 livros", required_points: 40, formatted_value: "10%",
                company_name: "Saraiva", code: "SARAIVA10", quantity: 30)
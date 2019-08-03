#Create Users
user = User.create(name: "Vinicius da Silva", email: "vssilva233@gmail.com", password: "secret123", score: 100)
user = User.create(name: "Henrique Januário", email: "riquejanuario@gmail.com", password: "secret123", score: 120)

#Populate works, work_types, cities
UpdateDatabase.call

#Create PromoCodes
PromoCode.create(description: "Desconto na Saraiva ao comprar 2 livros", required_points: 40, formatted_value: "10% de desconto", 
                company_name: "Saraiva", code: "SARAIVA10", quantity: 30)

PromoCode.create(description: "Ao comprar um vestido, ganhe 30 reais de desconto em qualquer outro vestido", required_points: 50, formatted_value: "R$ 30 de desconto", 
  company_name: "Alugue seu Dress", code: "30VESTIDO", quantity: 80)


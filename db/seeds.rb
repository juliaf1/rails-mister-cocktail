require 'open-uri'

Ingredient.destroy_all

ingredients_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_list = JSON.parse(open(ingredients_url).read)

puts "Adding ingredients to DB..."

ingredients_list["drinks"].each do |ingredient|
  new_ingredient = Ingredient.create(name: ingredient["strIngredient1"])

  puts "#{new_ingredient.name} added 🍹"
end

puts "Adding some brazilian peppers..."

brazilian_ingredients = %w(Cachaça Canela Tang Jambu Açai Chantilly Manjericão)

brazilian_ingredients.each do |braz_i|
  new_braz_ingredient = Ingredient.create(name: braz_i)

  puts "#{new_braz_ingredient.name} added 🍹"
end

require 'rails_helper'

RSpec.describe "dishes show page" do
  context "as a visitor" do
    before(:each) do
      @chef1 = Chef.create(name: "Gordon")
      @dish1 = @chef1.dishes.create(name: "Beef Wellington", description: "Excellent")
      @ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      @ingredient2 = Ingredient.create(name: "Dough", calories: 50)
      @dish_ingredients1 = DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      @dish_ingredients2 = DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
    end

    it "can see list of ingredients and name of chef" do
      
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content(@dish1.name) 
      expect(page).to have_content(@ingredient1.name) 
      expect(page).to have_content(@ingredient2.name) 
      expect(page).to have_content(@chef1.name) 
    end

    it "can see total calories" do
      
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Total Calories: 150") 

    end
  end
end


# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name

# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
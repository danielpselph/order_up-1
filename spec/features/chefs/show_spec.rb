require 'rails_helper'

RSpec.describe "chefs show page" do
  context "as a visitor" do
    before(:each) do
      @chef1 = Chef.create(name: "Gordon")
      @dish1 = @chef1.dishes.create(name: "Beef Wellington", description: "Excellent")
      @dish2 = @chef1.dishes.create(name: "Lobster Risotto", description: "Superb")
      @ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      @ingredient2 = Ingredient.create(name: "Dough", calories: 50)
      @ingredient3 = Ingredient.create(name: "Lobster", calories: 150)
      @ingredient4 = Ingredient.create(name: "Rice", calories: 20)
      @ingredient5 = Ingredient.create(name: "Gordon Sauce", calories: 60)
      @dish_ingredients1 = DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      @dish_ingredients2 = DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
      @dish_ingredients5 = DishIngredient.create(dish: @dish1, ingredient: @ingredient5)
      @dish_ingredients3 = DishIngredient.create(dish: @dish2, ingredient: @ingredient3)
      @dish_ingredients4 = DishIngredient.create(dish: @dish2, ingredient: @ingredient4)
      @dish_ingredients6 = DishIngredient.create(dish: @dish2, ingredient: @ingredient5)
    end

    it "can see list of ingredients and name of chef" do
      
      visit "/chefs/#{@chef1.id}"
      
      expect(page).to have_content(@chef1.name) 

      click_link "View Ingredients"

      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients") 

      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)
      expect(page).to have_content(@ingredient5.name)

    end
  end
end

# tory 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
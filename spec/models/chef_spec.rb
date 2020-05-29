require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "methods" do
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
    it "#recipes" do
    # binding.pry
      expect(@chef1.recipes).to eq([@ingredient1, @ingredient2, @ingredient3, @ingredient4, @ingredient5]) 
    end
    
    
  end
  
end

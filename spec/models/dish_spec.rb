require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end
  describe "methods" do
    it "#calorie_count" do
    chef1 = Chef.create(name: "Gordon")
    dish1 = chef1.dishes.create(name: "Beef Wellington", description: "Excellent")
    ingredient1 = Ingredient.create(name: "Beef", calories: 100)
    ingredient2 = Ingredient.create(name: "Dough", calories: 50)
    dish_ingredients1 = DishIngredient.create(dish: dish1, ingredient: ingredient1)
    dish_ingredients2 = DishIngredient.create(dish: dish1, ingredient: ingredient2)

    expect(dish1.calorie_count).to eq(150) 
    end
    
    
  end
  
end

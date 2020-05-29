class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def recipes
    # binding.pry
    Ingredient.joins(:dish_ingredients).distinct
  end
  
end

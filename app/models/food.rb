
class Food

  def initialize(input)



    def self.find_business(food_id)
     business = Yelp.client.business(food_id)
     return self.new(business)
    end




end

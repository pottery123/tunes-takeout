
class Food
  attr_reader :name, :image, :rating, :reviews, :rating_image, :address

  def initialize(input)
    @image = input.business.image_url
    @name = input.business.name
    @rating = input.business.rating
    @reviews = input.business.review_count
    @rating_image = input.business.rating_img_url_large
    @address = input.business.location.display_address


    #@business = Yelp.client.business(input)
  end

    def self.find_business(food_id)
      uri = Addressable::URI.parse(food_id)

      @business = Yelp.client.business(uri.normalize.to_s)
      self.new(@business)
    end




end

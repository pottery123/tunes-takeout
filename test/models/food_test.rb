require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  describe "food knows how find businesses" do
  before do
    @food = Food.find_business("ohana-seattle-2")
  end

  it "knows its name", :vcr do
    assert_equal "Ohana", @food.name
  end

    it "it has an image", :vcr do
      assert_instance_of String, @food.image
    end
  end
end

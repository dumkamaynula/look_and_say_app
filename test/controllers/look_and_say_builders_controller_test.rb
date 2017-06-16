require 'test_helper'

class LookAndSayBuildersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@first_value = rand(1..10).to_s
  	@second_value = @first_value.gsub(/(.)\1*/) { |x| x.size.to_s + x.first}
  end


  test "should get result" do
    get root_url
    assert_response :success
  end

  test "should post calculation" do
    post look_and_say_builders_calculation_path, params: {string: "1"}, xhr: true
    assert_response :success
    assert_equal "text/javascript", @response.content_type 
  end
  test "should post calculation with nil params" do
    post look_and_say_builders_calculation_path, params: {string: nil}, xhr: true
    assert_response :success
    assert_equal "text/javascript", @response.content_type
  end
  test "should nothing raised for gsub" do
		assert_nothing_raised do
			@first_value.gsub(/(.)\1*/) { |x| x.size.to_s + x.first}
		end
	end
	test "should valid array values for identity of last char" do
		assert_equal @first_value[-1, 1], @second_value[-1, 1]
		#Explanation: Strings can take a negative index (-1), 
		#which count backwards from the end of the String, 
		#the second argument is a length of how many characters we need (1). 
	end
	test "should have infinity of 22" do
		assert_equal @value = "22", @value.gsub(/(.)\1*/) { |x| x.size.to_s + x.first}
	end

end

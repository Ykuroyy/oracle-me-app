require "test_helper"

class OracleCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oracle_cards_index_url
    assert_response :success
  end

  test "should get show" do
    get oracle_cards_show_url
    assert_response :success
  end
end

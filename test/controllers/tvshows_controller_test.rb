require "test_helper"

class TvshowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tvshow = tvshows(:one)
  end

  test "should get index" do
    get tvshows_url
    assert_response :success
  end

  test "should get new" do
    get new_tvshow_url
    assert_response :success
  end

  test "should create tvshow" do
    assert_difference("Tvshow.count") do
      post tvshows_url, params: { tvshow: { consumed: @tvshow.consumed, name: @tvshow.name, notes: @tvshow.notes, starred: @tvshow.starred, user_id: @tvshow.user_id } }
    end

    assert_redirected_to tvshow_url(Tvshow.last)
  end

  test "should show tvshow" do
    get tvshow_url(@tvshow)
    assert_response :success
  end

  test "should get edit" do
    get edit_tvshow_url(@tvshow)
    assert_response :success
  end

  test "should update tvshow" do
    patch tvshow_url(@tvshow), params: { tvshow: { consumed: @tvshow.consumed, name: @tvshow.name, notes: @tvshow.notes, starred: @tvshow.starred, user_id: @tvshow.user_id } }
    assert_redirected_to tvshow_url(@tvshow)
  end

  test "should destroy tvshow" do
    assert_difference("Tvshow.count", -1) do
      delete tvshow_url(@tvshow)
    end

    assert_redirected_to tvshows_url
  end
end

require "application_system_test_case"

class TvshowsTest < ApplicationSystemTestCase
  setup do
    @tvshow = tvshows(:one)
  end

  test "visiting the index" do
    visit tvshows_url
    assert_selector "h1", text: "Tvshows"
  end

  test "should create tvshow" do
    visit tvshows_url
    click_on "New tvshow"

    check "Consumed" if @tvshow.consumed
    fill_in "Name", with: @tvshow.name
    fill_in "Notes", with: @tvshow.notes
    check "Starred" if @tvshow.starred
    fill_in "User", with: @tvshow.user_id
    click_on "Create Tvshow"

    assert_text "Tvshow was successfully created"
    click_on "Back"
  end

  test "should update Tvshow" do
    visit tvshow_url(@tvshow)
    click_on "Edit this tvshow", match: :first

    check "Consumed" if @tvshow.consumed
    fill_in "Name", with: @tvshow.name
    fill_in "Notes", with: @tvshow.notes
    check "Starred" if @tvshow.starred
    fill_in "User", with: @tvshow.user_id
    click_on "Update Tvshow"

    assert_text "Tvshow was successfully updated"
    click_on "Back"
  end

  test "should destroy Tvshow" do
    visit tvshow_url(@tvshow)
    click_on "Destroy this tvshow", match: :first

    assert_text "Tvshow was successfully destroyed"
  end
end

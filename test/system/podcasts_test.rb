require "application_system_test_case"

class PodcastsTest < ApplicationSystemTestCase
  setup do
    @podcast = podcasts(:one)
  end

  test "visiting the index" do
    visit podcasts_url
    assert_selector "h1", text: "Podcasts"
  end

  test "should create podcast" do
    visit podcasts_url
    click_on "New podcast"

    check "Consumed" if @podcast.consumed
    fill_in "Name", with: @podcast.name
    fill_in "Notes", with: @podcast.notes
    fill_in "Podcast", with: @podcast.podcast
    check "Starred" if @podcast.starred
    fill_in "Url", with: @podcast.url
    fill_in "User", with: @podcast.user_id
    click_on "Create Podcast"

    assert_text "Podcast was successfully created"
    click_on "Back"
  end

  test "should update Podcast" do
    visit podcast_url(@podcast)
    click_on "Edit this podcast", match: :first

    check "Consumed" if @podcast.consumed
    fill_in "Name", with: @podcast.name
    fill_in "Notes", with: @podcast.notes
    fill_in "Podcast", with: @podcast.podcast
    check "Starred" if @podcast.starred
    fill_in "Url", with: @podcast.url
    fill_in "User", with: @podcast.user_id
    click_on "Update Podcast"

    assert_text "Podcast was successfully updated"
    click_on "Back"
  end

  test "should destroy Podcast" do
    visit podcast_url(@podcast)
    click_on "Destroy this podcast", match: :first

    assert_text "Podcast was successfully destroyed"
  end
end

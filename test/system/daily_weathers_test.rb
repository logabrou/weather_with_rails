require "application_system_test_case"

class DailyWeathersTest < ApplicationSystemTestCase
  setup do
    @daily_weather = daily_weathers(:one)
  end

  test "visiting the index" do
    visit daily_weathers_url
    assert_selector "h1", text: "Daily Weathers"
  end

  test "creating a Daily weather" do
    visit daily_weathers_url
    click_on "New Daily Weather"

    fill_in "Date", with: @daily_weather.date
    fill_in "Temperature", with: @daily_weather.temperature
    fill_in "Time", with: @daily_weather.time
    click_on "Create Daily weather"

    assert_text "Daily weather was successfully created"
    click_on "Back"
  end

  test "updating a Daily weather" do
    visit daily_weathers_url
    click_on "Edit", match: :first

    fill_in "Date", with: @daily_weather.date
    fill_in "Temperature", with: @daily_weather.temperature
    fill_in "Time", with: @daily_weather.time
    click_on "Update Daily weather"

    assert_text "Daily weather was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily weather" do
    visit daily_weathers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily weather was successfully destroyed"
  end
end

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get scraping_facebook" do
    get projects_scraping_facebook_url
    assert_response :success
  end

  test "should get scraping_google_calendar" do
    get projects_scraping_google_calendar_url
    assert_response :success
  end

  test "should get scraping_sites_pro" do
    get projects_scraping_sites_pro_url
    assert_response :success
  end

end

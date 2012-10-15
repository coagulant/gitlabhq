class DashboardSearch < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedPaths

  Given 'I search for "Sho"' do
    fill_in "dashboard_search", :with => "Sho"
    click_button "Search"
  end

  # FIXME: refactor 1 method
  Given 'I search for "Contibuting"' do
    fill_in "dashboard_search", :with => "Contibuting"
    click_button "Search"
  end

  # FIXME: refactor 1 method
  Then 'I should see "Contibuting guide" wiki link' do
    page.should have_link "Contibuting guide"
  end

  Then 'I should see "Shop" project link' do
    page.should have_link "Shop"
  end

  And 'I own project "Shop"' do
    @project = Factory :project, :name => "Shop"
    @project.add_access(@user, :admin)
  end

  And 'Project "Shop" has wiki page "Contibuting guide"' do
    @wiki_page = Factory :wiki, :project => @project,
                         :title => "Contibuting guide",
                         :slug => "contributing"
  end

end

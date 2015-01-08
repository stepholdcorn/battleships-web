require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^I have placed my ships$/) do
	visit path_to('the register page')
	fill_in("name", :with => "Steph")
	click_button("Register")
	click_button("Place ships!")
	fill_in("ac_coord", :with => "A1")
	select("horizontally", :from => "ac_orientation")

end

Given(/^I have a player$/) do
  step "I am on the register page"
  step 'I fill in "name" with "Steph"'
  step 'I press "Register"'
  # step 'I press "Next"'
end
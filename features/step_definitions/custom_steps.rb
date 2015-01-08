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
	step 'I fill in "bs_coord" with "A1"'
	step 'I select "horizontally" from "bs_orientation"'
	step 'I fill in "ac_coord" with "B1"'
	step 'I select "horizontally" from "ac_orientation"'
	step 'I fill in "d_coord" with "C1"'
	step 'I select "horizontally" from "d_orientation"'
	step 'I fill in "s_coord" with "D1"'
	step 'I select "horizontally" from "s_orientation"'
	step 'I fill in "pb_coord" with "E1"'
	step 'I select "horizontally" from "pb_orientation"'
	step 'I press "Place"'
end

Then(/^I should see ship 25 times$/) do
  page.assert_text("ship", options = { count: 25 })
end

Given(/^I have a player$/) do
  step "I am on the register page"
  step 'I fill in "name" with "Steph"'
  step 'I press "Register"'
end
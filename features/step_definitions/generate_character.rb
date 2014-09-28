require_relative '../../lib/character'

# NOTE: This is what they mean by input-compute-output!!

# Input:
Given(/^I have created a character "(.*?)" with job "(.*?)"$/) do |name, job|
  @name = name
  @job = job
end

# Compute:
When(/^I submit the info to the generator$/) do
  @output = `ruby generator.rb #{@name} #{@job}`
end

# Output:
Then(/^it should generate a Character with that "(.*?)" and "(.*?)"$/) do |expected_name, expected_job|
  expect(@output).to eq "#{expected_name} - #{expected_job}"
end

Given(/^I have created a character with an invalid "(.*?)"$/) do |name|
  @name = name
  @job = "Tactician"
end

Then(/^it should tell me "(.*?)"$/) do |expected_output|
  expect(@output).to eq expected_output
end

Given(/^I have created a character with a "(.*?)" and an invalid "(.*?)"$/) do |name, job|
  @name = name
  @job = job
end

Then(/^it should print "(.*?)"$/) do |expected_output|
  expect(@output).to eq expected_output
end
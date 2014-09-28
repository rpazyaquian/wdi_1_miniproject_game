require_relative '../../lib/character'

Given(/^"(.*?)" the "(.*?)" is generated$/) do |name, job|
  @name = name
  @job = job
end

When(/^the character is inspected$/) do
  @output = `ruby generator.rb #{@name} #{@job} -i`
end

Then(/^it should print "(.*?)"$/) do |expected_output|
  pending
  expect(@output).to eq expected_output
end

require 'spec_helper'
require 'capybara/rspec'
require './app'

describe '/', type: :feature do
  it 'displays the homepage' do
    visit '/'
    expect(page).to have_content('Visit either the Store or shoe Brands page to continue.')
  end

  it 'goes to bands page' do
   visit '/'
   click_link 'Brands'
   expect(page).to have_content('Brands')
  end
end

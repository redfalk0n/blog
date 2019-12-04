require 'rails_helper'

RSpec.describe 'Rspec demo', type: :feature do
  scenario 'index page' do
    # @post = posts(:one)
    # byebug
    # visit '/posts/1' #post_url(@post)
    visit root_path
    click_on('test post')
    sleep(1)
    expect(page).to have_content('test post')
  end
end
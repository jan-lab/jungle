require 'rails_helper'

#to use the javascript-enabled (ie real) browser by specifying js: true in the feature declaration
RSpec.feature "Visitor adds a product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart updated" do
    # ACT
    visit root_path

    first("article.product").find_button("Add").click
    
    # DEBUG - use screenshots to debug
    save_screenshot

    # VERIFY
    # to output the current HTML being rendered by our browser
    # puts page.html
    expect(page).to have_content 'My Cart (1)'
    
  end

end
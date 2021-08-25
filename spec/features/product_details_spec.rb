require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

#to use the javascript-enabled (ie real) browser by specifying js: true in the feature declaration
RSpec.feature "Visitor navigates to product details", type: :feature, js: true do

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

  scenario "They see product details" do
    # ACT
    visit root_path

    first("article.product").find_link("Details").click
    
    # DEBUG #Use screenshots to debug
    save_screenshot

    # VERIFY
    #to output the current HTML being rendered by our browser
    puts page.html
    #We set our first expectation of content we expect the user to see on the page. Since each _product partial renders an article with class product, we are expecting to find at least one on the page. 
    #our home page is expected to list ALL products
    # expect(page).to have_css 'article.product', count: 10
    expect(page).to have_content 'Quantity'
    
  end

end
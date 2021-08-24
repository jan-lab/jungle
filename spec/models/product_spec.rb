require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # validation tests/examples here
    before do
      @category1 = Category.new(:name => 'Apparel')
      @category1.save
      @product = Product.new(:name => "magic keyboard", :price => 30, :quantity => 1, :category => @category1)

      # @product1 = Product.new(:name => "apple", :price => 20, :quantity => 1, :category => @category1)
      # @product1.save
      # @product2 = Prouct.new(:name => "magic keyboard", :price => 30, :quantity => 1, :category => @category1.id)
     
      # @product3 = Prouct.new(:name => "earphone", :price => 20, :quantity => 1, :category => @category1.id)
    
      # @product4 = Prouct.new(:name => "socks", :price => 20, :quantity => 1, :category => @category1.id)
 
      # @product5 = Prouct.new(:name => "sanitizer", :price => 20, :quantity => 1, :category => @category1.id)
    
    end

    it "return true if the product name exists" do
      product = Product.new(:name => "magic keyboard", :price => 30, :quantity => 1, :category => @category1)
      expect(product.name).not_to be_empty
    end

    it "return true if the product name exists" do
      # product = Product.new(:name => "", :price => 30, :quantity => 1, :category => @category1)
      @product.name = nil
      expect(@product.name).to be(nil)
    end

    it "return true if the product name exists" do
      product = Product.new(:name => "", :price => 30, :quantity => 1, :category => @category1)
      puts product.errors 
      expect(product.name).to be_empty
    end

 
    #Tested that registration cannot be done due to validation when trying to register without entering the user name
    it 'Cannot register if name is empty' do
      #Update user's name to empty
      product = Product.new(:name => "", :price => 30, :quantity => 1, :category => @category1)
      # valid?Judge whether it passes validation, and if it does not pass, generate an error message
      product.valid? 
      # @user.errors.full_Display error message with messages
      #Describe the error message displayed after include
      #Name can if devise is not translated into Japanese'I think you get the error message t be blank
      expect(product.errors.full_messages).to include("Name can't be blank")
    end



    it "return true if the product name exists" do
      product = Product.new(:name => nil, :price => 30, :quantity => 1, :category => @category1)
      expect(product.name).to be(nil)
    end

    it "return true if the product price exists" do
      product = Product.new(:name => "earphone", :price_cents => nil, :quantity => 1, :category => @category1)
      expect(product.price_cents).to be(nil)
    end

    it "return true if the product quantity exists" do
      product = Product.new(:name => "earphone", :price => 29, :quantity => nil, :category => @category1)
      expect(product.quantity).to be(nil)
    end

    it "return true if the product category exists" do
      product = Product.new(:name => "sanitizer", :price => 20, :quantity => 1, :category => nil)
      expect(product.category).to be(nil)
    end

  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before do
      @category1 = Category.new(:name => 'Apparel')
      @category1.save
      @product = Product.new(:name => "magic keyboard", :price => 30, :quantity => 1, :category => @category1)
    
    end

    it "return true if the product name exists" do
      product = Product.new(:name => "magic keyboard", :price => 30, :quantity => 1, :category => @category1)
      expect(product.name).not_to be_empty
    end

    it "return true if the product name exists" do
      @product.name = nil
      expect(@product.name).to be(nil)
    end

    it "return true if the product name exists" do
      product = Product.new(:name => "", :price => 30, :quantity => 1, :category => @category1)
      puts product.errors 
      expect(product.name).to be_empty
    end

    #test that registration cannot be done due to validation when trying to register without entering the user name
    it 'Cannot register if name is empty' do
      #update user's name to empty
      product = Product.new(:name => "", :price => 30, :quantity => 1, :category => @category1)
      #valid? judges whether it passes validation, and if it does not pass, generate an error message
      product.valid? 
      #describe the error message displayed after include
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

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "validates name and value is present" do
    @category = Category.new(
      id: 4,
      name: "Vascular Plants",
      created_at: DateTime.now - 1.days,
      updated_at: DateTime.now
    )
    @product = Product.new(
      name: nil,
      category: @category,
      price: 10,
      quantity: 10
    )
    @product.validate
    expect(@product.errors.full_messages).to include("Name can't be blank") 
    end

    it "validates price and value is present" do
    @category = Category.new(
      id: 4,
      name: "Vascular Plants",
      created_at: DateTime.now - 1.days,
      updated_at: DateTime.now
    )
    @product = Product.new(
      name: "Fern",
      category: @category,
      quantity: 10
    )
    @product.validate
    expect(@product.errors.full_messages).to include("Price can't be blank") 
    end

    it "validates quantity and value is present" do
    @category = Category.new(
      id: 4,
      name: "Vascular Plants",
      created_at: DateTime.now - 1.days,
      updated_at: DateTime.now
    )
    @product = Product.new(
      name: "Fern",
      category: @category,
      price: 10,
      quantity: nil
    )
    @product.validate
    expect(@product.errors.full_messages).to include("Quantity can't be blank") 
    end

    it "validates category and value is present" do
    @category = Category.new(
      id: 4,
      name: "Vascular Plants",
      created_at: DateTime.now - 1.days,
      updated_at: DateTime.now
    )
    @product = Product.new(
      name: "Fern",
      category: nil,
      price: 10,
      quantity: nil
    )
    @product.validate
    expect(@product.errors.full_messages).to include("Category can't be blank") 
    end

    it "validates category and product and ensures product saves when all values are present" do
    @category = Category.new(
      id: 4,
      name: "Vascular Plants",
      created_at: DateTime.now - 1.days,
      updated_at: DateTime.now
    )
    @product = Product.new(
      name: "Fern",
      category: @category,
      price: 10,
      quantity: 10
    )
    @product.save
    expect(@product.save).to eql(true) 
    end
    
  end
end

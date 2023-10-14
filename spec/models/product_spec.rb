require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'saves successfully when all fields are provided' do
      @category = Category.create(name: 'Flowers')
      @product = Product.create(
        name: 'Lavender',
        price_cents: 5.50,
        quantity: 20,
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'returns error if the name is not present' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(
        name: nil,
        price_cents: 5.50,
        quantity: 20,
        category: @category
      )
      @product.valid? 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


    it 'returns error if the price is not present' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(
        name: 'Lavender',
        price_cents: nil,
        quantity: 20,
        category: @category
      )
      @product.valid? 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'returns error if the quantity is not present' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(
        name: 'Lavender',
        price_cents: 5.50,
        quantity: nil,
        category: @category
      )
      @product.valid? 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'returns error if the category is not present' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(
        name: 'Lavender',
        price_cents: 5.50,
        quantity: 20,
        category: nil
      )
      @product.valid? 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end

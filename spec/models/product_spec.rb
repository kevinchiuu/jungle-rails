require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'saves product to database successfully' do
      category = Category.create(name: "Wands")
      product = Product.create(name: "Mango Wand", price: 9000, quantity: 69, category: category)
      expect(product).to be_present
    end 

    it 'makes sure name is present' do
      category = Category.create(name: "Wands")
      product = Product.create(name: nil, price: 9000, quantity: 69, category: category)
      expect(product.errors.full_messages).to include("Name cant be blank")
    end

    it 'makes sure price is present' do
      category = Category.create(name: "Wands")
      product = Product.create(name: "Mango Wand", price: nil, quantity: 69, category: category)
      expect(product.errors.full_messages).to include("Price cant be blank")
    end

    it 'makes sure quantity is present' do
      category = Category.create(name: "Wands")
      product = Product.create(name: nil, price: 9000, quantity: nil, category: category)
      expect(product.errors.full_messages).to include("Quantity cant be blank")
    end

    it 'makes sure category is present' do
      category = Category.create(name: "Wands")
      product = Product.create(name: nil, price: 9000, quantity: 69, category: nil)
      expect(product.errors.full_messages).to include("Category cant be blank")
    end

  end
end
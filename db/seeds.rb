require "csv"

AdminUser.destroy_all

OrderLineItem.destroy_all
Product.destroy_all
Order.destroy_all
Customer.destroy_all
Address.destroy_all
Category.destroy_all
Province.destroy_all
Tax.destroy_all

category_file = Rails.root.join("db/category.csv")
products_file = Rails.root.join("db/products.csv")

category_data = File.read(category_file)
categories = CSV.parse(category_data, headers:true, encoding: "utf-8")

products_data = File.read(products_file)
products = CSV.parse(products_data, headers:true, encoding: "utf-8")

categories.each do |c|
  category = Category.find_or_create_by(category_name: c["Name"])
end

all_categories = Category.all

products.each do |p|
  Product.create(product_name: p["Title"], Category_id: random_subject = Category.random_records(1).take["id"], price: Faker::Number.decimal(l_digits: 3, r_digits: 2))
end

AdminUser.create!(email: 'real_admin@realadmin.com', password: 'admin_password', password_confirmation: 'admin_password') if Rails.env.development?
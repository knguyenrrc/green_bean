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
categories = CSV.parse(category_data, headers: true, encoding: "utf-8")

products_data = File.read(products_file)
products = CSV.parse(products_data, headers: true, encoding: "utf-8")

categories.each do |c|
  Category.find_or_create_by(category_name: c["Name"])
end

# all_categories = Category.all

products.each do |p|
  Product.create(product_name: p["Title"],
                 Category_id:  Category.random_records(1).take["id"],
                 price:        Faker::Number.decimal(l_digits: 3, r_digits: 2))
end

# Province.create(name: "AB", gst: 0.05, pst: 0, hst: 0)
# Province.create(name: "BC", gst: 0.05, pst: 0.07, hst: 0)
# Province.create(name: "MB", gst: 0.05, pst: 0.07, hst: 0)
# Province.create(name: "NB", gst: 0, pst: 0, hst: 0.15)
# Province.create(name: "NL", gst: 0, pst: 0, hst: 0.15)
# Province.create(name: "NT", gst: 0.05, pst: 0, hst: 0)
# Province.create(name: "NS", gst: 0, pst: 0, hst: 0.15)
# Province.create(name: "NU", gst: 0.05, pst: 0, hst: 0)
# Province.create(name: "ON", gst: 0, pst: 0, hst: 0.13)
# Province.create(name: "PE", gst: 0, pst: 0, hst: 0.15)
# Province.create(name: "QC", gst: 0.05, pst: 0.09975, hst: 0)
# Province.create(name: "SK", gst: 0.05, pst: 0.06, hst: 0)
# Province.create(name: "YT", gst: 0.05, pst: 0, hst: 0)

if Rails.env.development?
  AdminUser.create!(email: "real_admin@realadmin.com", password: "admin_password",
                    password_confirmation: "admin_password")
end

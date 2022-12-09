ActiveAdmin.register Product do

  permit_params :product_name, :price, :Category_id, :image
  filter :created_at


  index do
    selectable_column
    column :id
    column :product_name
    column :price
    column :categories do |product|
      category = Category.find(product.Category_id)
      link_to category.category_name, admin_category_path(category)
    end
    actions
  end

  show do |product|
    attributes_table do
      row :product_name
      row :price
      row :categories do |product|
        category = Category.find(product.Category_id)
        link_to category.category_name, admin_category_path(category)
      end
      row :image do
        image_tag(product.image, size:"250x250")
      end
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs "Product" do
      f.input :product_name
      f.input :price

      f.input :Category, as: :select, collection: Category.all.map{|c| [c.category_name, c.id]}

      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, size:"250x250") : content_tag(:span, "No Image Yet")
    end

    f.actions
  end
end

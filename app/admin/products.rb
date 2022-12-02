ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :product_name, :price, order_line_items: [:id, :Product_id, :Category_id, :_destroy]
  permit_params :product_name, :price, :Category_id, :image
  filter :created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_name, :price, :Category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column :id
    column :product_name
    column :price
    # column :image
    column :categories do |product|
      # product.categories.map { |pd| pd.product_name }.join(", ").html_safe
      category = Category.find(product.Category_id)
      link_to category.category_name, admin_category_path(category)
    end
    actions
  end

  show do |product|
    attributes_table do
      row :product_name
      row :price
      # row :categories do |product|
      #   product.categories.map { |pd| pd.product_name }.join(", ").html_safe
      # end
      row :categories do |product|
        # product.categories.map { |pd| pd.product_name }.join(", ").html_safe
        category = Category.find(product.Category_id)
        link_to category.category_name, admin_category_path(category)
      end
      row :image do
        # image_tag url_for(product.image, size:"250x250")
        image_tag(product.image, size:"250x250")
      end
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs "Product" do
      f.input :product_name
      f.input :price
      # f.has_many :order_line_items, allow_destroy: true do |n_f|
      #   n_f.input :category_id
      # end
      # f.input :Category do |cat|
      #   cat.categories.map { |pd| pd.product_name }.join(", ").html_safe
      #   # category = Category.find(cat.Category_id)
      #   # link_to category.category_name, admin_category_path(category)
      # end
      # f.input :Category_id do, as: :select, collection: Category.select(:category_name).uniq
      # f.input :Category_id do |cat|
      #   category = Category.find(cat.Category_id)
      #   link_to category.category_name, admin_category_path(category)
      # end
      f.input :Category, as: :select, collection: Category.all.map{|c| [c.category_name, c.id]}
      # f.has_many :order_line_items, allow_destroy: true do |n_f|
      #   n_f.input :Category_id
      # end
      # f.input :Category_id
      #     # cat.categories.map { |pd| pd.product_name }.join(", ").html_safe
      #   category = Category.find(cat.Category_id)
      #   link_to category.category_name, admin_category_path(category_name)
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, size:"250x250") : content_tag(:span, "No Image Yet")
      # end
    end

    f.actions
  end
end

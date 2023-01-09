ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :price, :images, :unit_price,:size, :status,:category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :unit_price
      f.input :size
      f.input :status
      f.input :category, as: :select, collection: Category.all.map { |c| [c.title, c.id] }, include_blank: false, :input_html => { :width => 'auto' }
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  controller do    
    def create
      super
      # resource
      if params[:product][:images].present?
        params[:product][:images].each do |img|
          resource.pictures.attach(img)
        end
      end
    end

    def update
      super
      if params[:product][:images].present?
        params[:product][:images].each do |img|
          resource.pictures.attach(img)
        end
      end
    end
  end
end

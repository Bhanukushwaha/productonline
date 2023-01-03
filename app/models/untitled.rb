ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :price
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

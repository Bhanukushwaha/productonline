ActiveAdmin.register Feedback do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :product_id, :user_id, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :user_id, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :product_id, as: :select, collection: Product.all.map { |c| [c.name, c.id] }, include_blank: false, :input_html => { :width => 'auto' }
      f.input :user_id, as: :select, collection: User.all.map { |c| [c.first_name, c.id] }, include_blank: false, :input_html => { :width => 'auto' }
      f.input :description
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  
end

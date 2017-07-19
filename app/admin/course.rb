ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :title, :description, :price, :status, :image

  show do
    attributes_table do

      row :title
      row :description
      row :price do
        number_to_currency(course.price)
      end
      row :status
      row :image do
        # image_tag ad.image.url
        course.image.present? ? image_tag(course.image.url, height: 200, width: 200) : content_tag(:span, 'No Image')
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :status, as: :select, collection: ["Active", "Not Active"], include_blank: false
      # f.input :image, hit: course.image.present? ? "adadsda" : "ddddd"

      f.input :image, hint: course.image.present? ? image_tag(course.image.url, height: 200, width: 200) : content_tag(:span, 'No Image')

      # f.input :image, required: false, hint: image_tag(course.image.url(:medium)).html_safe

    end
    f.actions
  end
end

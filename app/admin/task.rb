ActiveAdmin.register Task do
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
#
#   index do
#     column :title
#     actions
#   end
#
#
#   show do
#     attributes_table do
#       row :title
#     end
#     active_admin_comments
#   end


# form do |f|
#   # f.object.published_at = DateTime.now
#   f.inputs "cacam Details" do
#     f.input :course_id
#     f.input :title
#     # f.input :published_at
# end
# end
permit_params :course_id, :title, :description, :video_url, :image


index do
  column :course_id
  column :title
  column :description
  column :video_url
  column :image
  actions
end



show do
  attributes_table do

    row :course_id
    row :title
    row :description
    row :video_url
    row :image do
      # image_tag ad.image.url
      task.image.present? ? image_tag(task.image.url, height: 200, width: 200) : content_tag(:span, 'No Image')
    end
  end
  active_admin_comments
end


form do |f|
  f.inputs do
    f.input :course_id, as: :select,  collection: Task.all, include_blank: false

    f.input :title
    f.input :description
    f.input :video_url
    f.input :image, hint: task.image.present? ? image_tag(task.image.url, height: 200, width: 200) : content_tag(:span, 'No Image')

  end
  f.actions
end

end

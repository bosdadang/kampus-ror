# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  title       :string
#  description :text
#  video_url   :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :course
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :video_url, presence: true

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end

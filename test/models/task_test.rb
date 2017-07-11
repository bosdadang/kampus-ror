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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

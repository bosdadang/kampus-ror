# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :money
#  status      :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :price, presence: true, numericality: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  validates :status, presence: true, length: {maximum: 10}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end

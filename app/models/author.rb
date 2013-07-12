# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  bio        :text
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ActiveRecord::Base
  attr_accessible :age, :bio, :first_name, :last_name

  validates_presence_of :first_name

  validates_numericality_of :age

end

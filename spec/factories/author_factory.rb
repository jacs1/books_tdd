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

FactoryGirl.define do

  factory :author, class: Author do
    first_name 'Bob'
    last_name  'Bobson'
    bio             'He is an author'
    age             35
  end



end

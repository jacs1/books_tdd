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
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    bio             Faker::Lorem.paragraph(4)
    age             rand(120)
  end

end

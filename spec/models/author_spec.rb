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

require 'spec_helper'

#this class must be a real class
describe Author do
  subject(:author) { Author.create(first_name: 'Bob', last_name: 'Bobson', bio: 'he is an author', age: 35) }

  it 'exists' do
    author = Author.create()
    expect(author).to_not be_nil
  end

  context 'attributes' do

    it 'has a first name' do
      author.first_name.should eq 'Bob'
    end
    it 'has a last name' do
      author.last_name.should eq 'Bobson'
    end
    it 'has a bio' do
      author.bio.should eq 'he is an author'
    end
    it 'has an age' do
      author.age.should eq 35
    end
  end

  context 'validations' do

    context 'with valid attributes' do
      it 'is valid' do
        author.should be_valid
      end
    end

    context 'with invalid attributes' do
      it 'must have a first name' do
        author.update_attributes(first_name: nil)
        author.should_not be_valid
      end

      it 'must have a numerical age' do
        author.update_attributes(age: 'hello')
        author.should_not be_valid
      end
    end

  end


end

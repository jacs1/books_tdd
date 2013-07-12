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
  subject(:author) { FactoryGirl.create(:author) }

  it 'exists' do
    author = Author.create()
    expect(author).to_not be_nil
  end

  context 'attributes' do
    let(:factory_author){ FactoryGirl.create(:author) }
    its(:first_name) { should eq factory_author.first_name }
    its(:last_name) { should eq factory_author.last_name }
    its(:bio) { should eq factory_author.bio }
    its(:age) { should eq factory_author.age }
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

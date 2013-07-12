require 'spec_helper'

#this class must be a real class
describe Author do

  it 'exists' do
    author = Author.create()
    expect(author).to_not be_nil
  end

  context 'attributes' do

    let(:author) { Author.create(first_name: 'Bob', last_name: 'Bobson', bio: 'he is an author', age: 35) }

    it 'has a first name' do
      puts subject
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


end












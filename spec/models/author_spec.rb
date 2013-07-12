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
    it {should_not be factory_author}
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
      it { should validate_presence_of(:first_name) }
      it { should validate_numericality_of(:age) }
    end
  end

  context 'associations' do
    it { should have_many(:books) }
  end

  context 'instance methods' do
    context '.buy_book_and_rename' do
      let(:book) { Book.create }
      before do
        subject.buy_book_and_rename(book)
      end
      it 'owns the book' do
        book.should be_in(subject.books)
      end
      it 'changes the title' do
        book.title.should eq 'Oreilly'
      end
    end
  end

  context 'class methods' do

  end

end









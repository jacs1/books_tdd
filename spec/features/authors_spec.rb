require 'spec_helper'

describe 'Authors' do

  describe 'the home page' do
    it 'can be landed on' do
      visit root_path
      # find('h1').should have_content 'Home'
      current_path.should eq root_path
    end
  end

  describe 'the New Author page' do
    before do
      visit new_author_path
    end

    it 'can be landed on' do
      visit new_author_path
      current_path.should eq new_author_path
    end
    it 'has a form' do
      page.should have_selector('form#new_author')
    end

    it 'has appropriate form fields' do
      within('#new_author') do
        page.should have_selector('input#author_first_name[type=text]')
        page.should have_selector('input#author_last_name[type=text]')
        page.should have_selector('input#author_age[type=number]')
        page.should have_selector('input#author_bio[type=text]')
      end
    end
    context 'form filling' do

      context 'valid attributes' do
        let(:author){FactoryGirl.build(:author)}

        it 'can create a new author via the form' do
          expect {
            within('form#new_author') do
              fill_in 'First name', with: author.first_name
              fill_in 'Last name', with: author.last_name
              fill_in 'Age', with: author.age
              fill_in 'Bio', with: author.bio
              click_button 'Create Author'
            end
          }.to change{ Author.count}.by 1
        end

        it 'redirects to the author show page on correctly submitting form' do
          within('form#new_author') do
            fill_in 'First name', with: author.first_name
            fill_in 'Last name', with: author.last_name
            fill_in 'Age', with: author.age
            fill_in 'Bio', with: author.bio
            click_button 'Create Author'

            #this test is not robust enough. too dependent on db structure.
            current_path.should eq author_path(Author.first)
          end
        end
      end
      context 'invalid attributes' do

        it 'should flash an error if an author is not created' do
         pending
        end

        it 'should redirect back to the new page if an author is not created' do
          current_path.should eq new_author_path
        end
      end
    end



  end

end




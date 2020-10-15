RSpec.feature 'Admin Static Content', :js do
  stub_authorization!
  let!(:store) { create(:store, default: true) }

  context 'when no page exists' do
    background do
      visit spree.admin_pages_path
    end

    scenario 'can create new page' do
      expect(page).to have_text 'No Page found, Add One!'

      click_link 'New page'
      expect(page).to have_text 'Pages'

      fill_in 'page_title', with: 'Contact us'
      fill_in 'page_slug', with: 'contact-us'
      fill_in 'page_body', with: 'hello..'

      fill_in 'page_meta_title', with: 'Contact us'
      fill_in 'page_meta_keywords', with: 'spree, contact'
      fill_in 'page_meta_description', with: 'Short description for contact page.'

      check 'page_show_in_sidebar'
      check 'page_show_in_header'
      check 'page_show_in_footer'

      expect(find('#page_visible')).to be_checked

      click_button 'Create'
      expect(page).to have_text 'successfully created!'
    end
  end

  context 'when page exists' do
    given!(:static_page) { create(:page) }

    background do
      visit spree.admin_pages_path
    end

    scenario 'can be updated' do
      within_row(1) { click_icon :edit }

      fill_in 'page_title', with: 'Contact'
      fill_in 'page_slug', with: 'contact'

      click_button 'Update'
      expect(page).to have_text 'successfully updated!'
    end

    scenario 'can be deleted' do
      within_row(1) { click_icon :delete }
      page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist
      expect(page).to have_text 'successfully removed!'
      expect(page).not_to have_text static_page.title
    end
  end
end

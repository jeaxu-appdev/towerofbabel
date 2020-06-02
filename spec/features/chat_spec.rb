# coding: utf-8
require "rails_helper"
Rails.application.load_seed

describe "Chat feature" do

  before(:all) do
    visit "/"
    find_link("Sign up", match: :first).click
    fill_in "Email", with: "alice@example.com"
    fill_in "Name", with: "Alice"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    find_button("Sign up").click
  end

  describe "Chat page" do
    before(:all) do
      visit "/"
      fill_in "Email", with: "alice@example.com"
      fill_in "Password", with: "password"
      find_button("Sign in").click

      fill_in "Title", with: "Taxi in Rome"
      select "Italian", from: "Default guest language"
      click_on "Create chat"

      fill_in "Your message", with: "To The Basilica of San Clemente please"
      click_on "Send message"
      @current_chat_url = current_url
    end

    scenario "when user creates a chat with valid data", points: 2 do
      # page should have a sharable link
      expect(page).to have_content URI.parse(current_url)

      # page should have guest default language
      expect(page).to have_content "Italian"

      # page should have user language
      expect(page).to have_select("", selected: "English")

      # page should have a delete link for user
      expect(page).to have_css("a", text: "Delete chat")

      # page should have edit chat form
      expect(page).to have_field("Title", with: "Taxi in Rome")
      expect(page).to have_button "Update chat"

      # page should have the message
      expect(page).to have_content(/To The Basilica of San Clemente please/)
     end


    scenario "when guest visits a chat link", points: 4 do
      Capybara.reset_sessions!
      visit @current_chat_url

      # page should select guests language in their format
      expect(page).to have_select("Language", selected: "Italiano")

      # page should name guest as Guest
      expect(page).to have_field("Name", with: "Guest")

      # page should not have a delete link for guest
      expect(page).not_to have_link("a", text: "Delete chat")

      # page should have message in guest language
      expect(page).to have_content(/Per la Basilica di San Clemente, per favore/)
    end

    context "Guest sends a message to user", points: 4 do
      before(:all) do
        visit @current_chat_url
        fill_in "Your message", with: "È quello vicino al Colosseo?"
        click_on "Send message"
      end

      scenario "guest sends a message" do
        expect(page).to have_content(/È quello vicino al Colosseo?/)
      end

      scenario "user receives guest's message" do
        visit "/"
        fill_in "Email", with: "alice@example.com"
        fill_in "Password", with: "password"
        click_button "Sign in", match: :first

        visit @current_chat_url
        expect(page).to have_content(/Is that near the Colosseum?/)
      end
    end
  end
end 

require "rails_helper"

feature "playing a game" do
  context "when user wins the game" do
    scenario "the user selects a winning throw and is shown the game's result" do
        allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")

      visit '/games/new'

      # user chooses winning throw
      click_button("throw-scissors")
      # user sees that the user won 
      within("h2") do
        expect(page).to have_content("User Won!!!")
      end
      # and the result for the user throw
      within("span") do
        expect(page).to have_content("cut")
      end
    end
  end

  context "when user loses the game" do
    scenario "the user selects a losing throw and is shown the game's result" do
      # stub the computer throw
      allow_any_instance_of(Game).to receive(:computer_throw).and_return("paper")

      visit '/games/new'

      # user chooses losing throw
      click_button("throw-rock")
      # user sees that the user lost 
      within("h2") do
        expect(page).to have_content("User Lost")
      end
      # and the result for the user throw
      within("span") do
        expect(page).to have_content("is covered by")
      end
    end
  end
end

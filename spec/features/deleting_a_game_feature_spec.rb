require "rails_helper"

feature "deleting a game" do
  scenario "the user visits homepage and deletes a recent game" do
  	visit "/games"
  	game = Game.create!(user_throw: "paper")
  	visit "/"
  	within(".recent-games") do
  		click_link("Destroy")
  	end
  	expect(page).to have_current_path games_path
  	expect(page).to_not have_content(game)
  	expect(Game.count).to eq 0
  end
end

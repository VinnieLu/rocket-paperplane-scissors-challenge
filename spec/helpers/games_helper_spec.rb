require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper module. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


describe GamesHelper do
  describe "#headline" do
    it "states that the user won when the user won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "rock")

      expect(helper.headline(game)).to eq "User Won!!!"
    end

    it "states that the user lost when the computer won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "scissors")

      expect(helper.headline(game)).to eq "User Lost"
    end
  end

  describe "#result_for_user_throw" do
    context "when the user won the game" do
      it "returns 'covers' when the user threw paper" do
        game = Game.new(user_throw: "paper", computer_throw: "rock")

        expect(helper.result_for_user_throw(game)).to eq "covers"
      end

      it "returns 'cut' when the user threw scissors" do
        game = Game.new(user_throw: "scissors", computer_throw: "paper")

        expect(helper.result_for_user_throw(game)).to eq "cut"
      end

      it "returns 'crushes' when the user threw rock" do
        game = Game.new(user_throw: "rock", computer_throw: "scissors")

        expect(helper.result_for_user_throw(game)).to eq "crushes"
      end
    end

    context "when the computer won the game" do
      it "returns 'covers' when the computer threw paper" do
        game = Game.new(user_throw: "rock", computer_throw: "paper")

        expect(helper.result_for_user_throw(game)).to eq "is covered by"
      end

      it "returns 'cut' when the computer threw scissors" do
        game = Game.new(user_throw: "paper", computer_throw: "scissors")

        expect(helper.result_for_user_throw(game)).to eq "is cut by"
      end

      it "returns 'crushes' when the computer threw rock" do
        game = Game.new(user_throw: "scissors", computer_throw: "rock")

        expect(helper.result_for_user_throw(game)).to eq "is crushed by"
      end
    end
  end

  describe "#throw_color" do
    it "returns 'danger' if a rock is thrown" do
      computer_throw = "rock"

      expect(helper.throw_color(computer_throw)).to eq "danger"
    end

    it "returns 'success' if a paper is thrown" do
      computer_throw = "paper"

      expect(helper.throw_color(computer_throw)).to eq "success"
    end

    it "returns 'info' if a scissors is thrown" do
      computer_throw = "scissors"

      expect(helper.throw_color(computer_throw)).to eq "info"
    end
  end

  describe "#throw_fa_icon" do
    it "expects 'fa-hand-rock-o' if rock is thrown" do
      computer_throw = "rock"

      expect(helper.throw_fa_icon(computer_throw)).to eq "fa-hand-rock-o"
    end

    it "expects 'fa-hand-stop-o' if paper is thrown" do
      computer_throw = "paper"

      expect(helper.throw_fa_icon(computer_throw)).to eq "fa-hand-stop-o"
    end

    it "expects 'fa-hand-scissors-o' if scissors is thrown" do
      computer_throw = "scissors"

      expect(helper.throw_fa_icon(computer_throw)).to eq "fa-hand-scissors-o"
    end
  end

end

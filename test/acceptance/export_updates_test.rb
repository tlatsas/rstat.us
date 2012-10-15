require 'require_relative' if RUBY_VERSION[0,3] == '1.8'
require_relative 'acceptance_helper'

describe "export updates" do
  include AcceptanceHelper

  describe "logged in" do
    before do
      Pony.deliveries.clear
      log_in_as_some_user
      update = Fabricate(:update, :author => @u.author)
    end

    it "has a link to export all updates" do
      visit "/users/#{@u.username}"
      assert has_link? "Export all updates"
    end

  end

  describe "unauthorized" do
    before { visit "/export" }
    it "should redirect to root page" do
      assert page.has_selector? 'div#signup'
    end
  end

end

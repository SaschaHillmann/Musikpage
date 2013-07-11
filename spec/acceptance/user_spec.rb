require 'acceptance/acceptance_helper'

feature "Account", %q{
	In order to access my account
	As an user
	I want to be able to sign up, log in 
	and if i am logged in, i want to be able to log out.
	} do
	scenario "user sign up" do		
		visit signup_path
		fill_in "Email", :with => "mustermann@muster.de"
		fill_in "Password", :with => "123456"
		click_button "Create User"
		page.should have_text("Logged in") 
	end
	scenario "user log in" do		
		User.create!(:email => 'mustermann@muster.de', :password => 'muster')
		visit login_path
		fill_in "Email", :with => "mustermann@muster.de"
		fill_in "Password", :with => "muster"
		click_button "Log In!"
		page.should have_text("Logged in") 
	end
	scenario "user log out" do		
		User.create!(:email => 'mustermann@muster.de', :password => 'muster')
		visit login_path
		fill_in "Email", :with => "mustermann@muster.de"
		fill_in "Password", :with => "muster"
		click_button "Log In!"		
		page.should have_text("Log Out") 
		visit logout_path
		page.should_not have_text("Log Out") 
	end
end

module AuthenticationHelpers
  module Controller
    def sign_in(user)
      controller.stub(:current_user).and_return(user)
      controller.stub(:user_id).and_return(user.id)
    end
  end

  module Features
    def sign_in(user, options={})
      visit "/login"
      fill_in "Email Address", with: user.email
      fill_in "Password", with: options[:password]
      click_button "Log In"
    end
  end
end
require "bigdecimal"

module FineAnts
  module Adapters
    class Fidelity
      def initialize(credentials)
        @user = credentials[:user]
        @password = credentials[:password]
      end

      def login
        visit "https://www.fidelity.com/"

        fill_in "Username", :with => @user
        fill_in "Password", :with => @password

        click_button "Log In"
      end

      def logout
      end

      def download
      end

      private
      def verify_login!
        find ".account-selector-wrapper"
      rescue Capybara::ElementNotFound
        raise FineAnts::LoginFailedError.new
      end
    end
  end
end

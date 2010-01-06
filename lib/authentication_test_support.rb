module ActionController
  class TestCase
    def self.logged_in_context(description = "", opts={}, &block)
      context "logged in user #{description}" do
        setup do
          activate_authlogic
          @user = Factory.build( :user, opts )
          UserSession.create @user
        end
        block.call
      end
    end
    def current_user
      @user
    end
  end
end
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_validate_presence_of :first_name, :last_name
  should_belong_to :company
end

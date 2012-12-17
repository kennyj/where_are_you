ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  def check(model, field, value)
    model.send("#{field}=", value)
    assert !model.valid?
    assert_equal 1, model.errors.size
  end
end

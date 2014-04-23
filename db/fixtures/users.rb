module Fixtures
  def users
    [{ email: 'mcloyd@mapc.org', password: 'password' }]
  end

  module_function :users
end
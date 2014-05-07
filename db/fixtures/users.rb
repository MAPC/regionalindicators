module Fixtures
  def users
    [{ id: 1, email: 'mcloyd@mapc.org',            password: 'password' },
     { id: 2, email: 'grimley@overcommaunder.com', password: 'password' },
     { id: 3, email: 'hstclair@mapc.org',          password: 'password' },
     { id: 4, email: 'jpartridge@mapc.org',        password: 'password' }]
  end

  module_function :users
end
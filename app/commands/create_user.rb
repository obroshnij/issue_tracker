class CreateUser
  prepend SimpleCommand

  attr_reader :email, :password, :name, :role

  def initialize(name, email, password, role)
    @email = email
    @name = name
    @password = password
    @role = role
  end

  def call
    User.create(
      email: email,
      name: name,
      password: password,
      role: role
    )
  end
end

class CreateUser
  prepend SimpleCommand

  attr_reader :email, :password, :name

  def initialize(name, email, password)
    @email = email
    @name = name
    @password = password
  end

  def call
    User.create(
      email: email,
      name: name,
      password: password
    )
  end
end

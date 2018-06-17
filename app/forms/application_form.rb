class ApplicationForm
  # simple form for interacting with model in DB.
  # call submit action with params from controller to mutate the data in DB

  # the form will handle validations and attributes assignment along with parameters whitelisting

  include Virtus.model
  include ActiveModel::Validations

  def submit params, &block
    self.attributes = model.attributes if model
    self.attributes = params.permit!
    return false unless valid?
    yield(model) if block_given?
    persist
    true
  end

  def model
    raise Exception, "'model' method must be implemented by #{self.class.name}"
  end

  def error
    { errors: errors.messages }
  end

  private

  def persist
    raise Exception, "'persist' method must be implemented by #{self.class.name}"
  end

end

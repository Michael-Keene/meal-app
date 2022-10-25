# frozen_string_literal: true
class ApplicationCommand

  include Dry::Monads[:result]

  def self.perform(*args, **kwargs)
    new(*args, **kwargs).perform
  end

  private

  def initialize
    raise NotImplementedError
  end

  def perform
    raise NotImplementedError
  end

end

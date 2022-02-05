class ApplicationCommand

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

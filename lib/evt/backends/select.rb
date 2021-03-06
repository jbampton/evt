# frozen_string_literal: true

class Evt::Select < Evt::Bundled
  def self.available?
    self.respond_to?(:select_backend)
  end

  def self.backend
    self.select_backend
  end

  def init_selector
    # Select is stateless
  end

  def register(io, interest)
    # Select is stateless
  end

  def deregister(io)
  end

  def wait
    select_wait
  rescue IOError => _
    collect(true)
    return [], []
  rescue Errno::EBADF => _
    collect(true)
    return [], []
  end
end

class Cora::Plugin

  attr_accessor :manager
  attr_reader :current_state

  class << self

    def listen_for(regex, options = {}, &block)
      default_listeners[regex] = {
        block: block,
        within_state: ([options[:within_state]].flatten)
      }
    end

    def default_listeners
      @default_listeners ||= {}
    end

  end

  def default_listeners
    self.class.default_listeners
  end

  def say(text)
    log "Say: #{text}"
    manager.respond(text)
  end

  def set_state(state)
    @current_state = state
  end

  def log(*args)
    manager.log(*args)
  end

end

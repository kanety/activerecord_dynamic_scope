require 'active_support'

require_relative 'activerecord_dynamic_scope/version'
require_relative 'activerecord_dynamic_scope/extension'
require_relative 'activerecord_dynamic_scope/railtie' if defined?(Rails)

module ActiveRecordDynamicScope
  KEY = :activerecord_dynamic_scope

  class << self
    def current(name)
      Thread.current[KEY].to_h[name]
    end

    def with(hash = {})
      old = Thread.current[KEY]
      Thread.current[KEY] = Thread.current[KEY].to_h.merge(hash)
      yield
    ensure
      Thread.current[KEY] = old
    end

    def without(keys)
      old = Thread.current[KEY]
      Thread.current[KEY] = Thread.current[KEY].to_h.except(keys)
      yield
    ensure
      Thread.current[KEY] = old
    end
  end
end

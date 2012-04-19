class Redis
  # Defines base functionality for all redis-objects.
  class BaseObject
    def initialize(key, *args)
      @key     = key.is_a?(Array) ? key.flatten.join(':') : key
      @options = args.last.is_a?(Hash) ? args.pop : {}
      @redis   = args.first || $redis || Redis.current
    end

    alias :inspect :to_s  # Ruby 1.9.2
    
    def to_ary
      respond_to?(:to_a) ? to_a : [self]
    end
  end
end

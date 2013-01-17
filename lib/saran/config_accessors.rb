module Saran
  module ConfigAccessors
    # Private: Creates accessors out of config keys
    #
    # Accepts:
    #   configs - Array of symbols.
    #
    # Example:
    #   define_config :endpoint
    #
    #   # This generates:
    #   def endpoint(arg=nil)
    #     @endpoint = arg if arg
    #     @endpoint
    #   end
    def self.define_config(*configs)
      configs.each do |config|
        instance_eval do
          define_method(config) do |value=nil|
            if value
              instance_variable_set("@#{config}", value)
            end

            instance_variable_get("@#{config}")
          end
        end
      end
    end

    define_config :endpoint, :access_token
  end
end

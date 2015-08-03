if RUBY_PLATFORM == 'opal'
  require 'native'
end

module Braintree

  class MainController < Volt::ModelController
    def index
    end

    private

    def index_ready
      options = parse(attrs.locals)
      ClientTokenTask.generate(attrs.locals).then do |client_token|
        handler = proc do |event, nonce|
          page._payment_method_nonce = nonce
          `$('#volt-braintree-form').parents('form').submit()`
        end
        %x{
          options["paymentMethodNonceReceived"] = handler;
          braintree.setup(client_token, "dropin", options);
        }
      end
    end

    def parse options
      result = { container: "volt-braintree-form" }
      options.keys.each do |key|
        result[key.split("__").last.to_sym] = options[key] if key.start_with?("client__")
      end
      result.to_n
    end
  end
end

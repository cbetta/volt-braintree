class ClientTokenTask < Volt::Task
  def generate *options
    Braintree::ClientToken.generate(parse(*options))
  end

  private

  def parse options={}
    result = {}
    options.keys.each do |key|
      result[key.split("__").last.to_sym] = options[key] if key.start_with?("server__")
    end
    result
  end

  def symbolize_keys! hash={}
    transform_keys!(hash){ |key| key.to_sym rescue key }
  end

  def transform_keys!(hash)
    hash.keys.each do |key|
      hash[yield(key)] = hash.delete(key)
    end
    hash
  end
end

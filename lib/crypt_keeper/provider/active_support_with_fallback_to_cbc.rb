require 'active_support/message_encryptor'

module CryptKeeper
  module Provider
    # Extends base active_support provider with fallback to old encryption rules to be able to read old encrypted values
    class ActiveSupportWithFallbackToCbc < ActiveSupport
      def initialize(options = {})
        super
        encryptor.rotate(cipher: 'aes-256-cbc')
      end
    end
  end
end

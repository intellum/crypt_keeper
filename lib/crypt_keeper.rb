require 'active_record'

require 'crypt_keeper/version'
require 'crypt_keeper/model'
require 'crypt_keeper/helper'
require 'crypt_keeper/provider/base'
require 'crypt_keeper/provider/active_support'
require 'crypt_keeper/provider/mysql_aes_new'
require 'crypt_keeper/provider/postgres_base'
require 'crypt_keeper/provider/postgres_pgp'
require 'crypt_keeper/provider/postgres_pgp_public_key'

module CryptKeeper
  class << self
    attr_accessor :stub_encryption
    alias_method :stub_encryption?, :stub_encryption

    attr_accessor :silence_logs
    alias_method :silence_logs?, :silence_logs

    # True for ActiveRecord >= 7.1 (serialize takes the coder: keyword). Must stay
    # true for AR 8.x — the previous MAJOR>=7 && MINOR>=1 check broke on 8.0.
    def active_record_7_1?
      version = Gem::Version.new(ActiveRecord::VERSION::STRING)
      version >= Gem::Version.new('7.1')
    end
  end
end

CryptKeeper.stub_encryption = false

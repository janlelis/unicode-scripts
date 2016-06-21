module Unicode
  module Scripts
    VERSION = "1.1.0".freeze
    UNICODE_VERSION = "9.0.0".freeze
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + '/../../../data/').freeze
    INDEX_FILENAME = (DATA_DIRECTORY + '/scripts.marshal.gz').freeze
  end
end


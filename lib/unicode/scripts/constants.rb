# frozen_string_literal: true

module Unicode
  module Scripts
    VERSION = "1.10.0"
    UNICODE_VERSION = "16.0.0"
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + "/../../../data/").freeze
    INDEX_FILENAME = (DATA_DIRECTORY + "/scripts.marshal.gz").freeze
  end
end

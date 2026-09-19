# frozen_string_literal: true

module Unicode
  module Scripts
    VERSION = "1.12.0"
    UNICODE_VERSION = "18.0.0"
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + "/../../../data/").freeze
    INDEX_FILENAME = (DATA_DIRECTORY + "/scripts.marshal.gz").freeze

    AUGMENTED_SCRIPT_CODES = ["Hanb", "Hntl",  "Jpan", "Kore"]
  end
end

require_relative 'constants'

module Unicode
  module Scripts
    INDEX = Marshal.load(Gem.gunzip(File.binread(INDEX_FILENAME)))
  end
end

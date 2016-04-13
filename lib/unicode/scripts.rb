require_relative "scripts/constants"

module Unicode
  module Scripts
    def self.scripts(string, **options)
      res = []
      string.each_char{ |char|
        script_name = script(char, **options)
        res << script_name unless res.include?(script_name)
      }
      res.sort
    end
    class << self; alias of scripts; end

    def self.script(char, format: :long)
      require_relative 'scripts/index' unless defined? ::Unicode::Scripts::INDEX
      codepoint_depth_offset = char.unpack("U")[0] or
          raise(ArgumentError, "Unicode::Scripts.script must be given a valid char")
      index_or_value = INDEX[:SCRIPTS]
      [0x10000, 0x1000, 0x100, 0x10].each{ |depth|
        index_or_value         = index_or_value[codepoint_depth_offset / depth]
        codepoint_depth_offset = codepoint_depth_offset % depth
        unless index_or_value.is_a? Array
          res = index_or_value || INDEX[:SCRIPT_ALIASES]["Zzzz"]
          return format == :long ? INDEX[:SCRIPT_NAMES][res] : INDEX[:SCRIPT_ALIASES].key(res)
        end
      }   

      res = index_or_value[codepoint_depth_offset] || INDEX[:SCRIPT_ALIASES]["Zzzz"]
      format == :long ? INDEX[:SCRIPT_NAMES][res] : INDEX[:SCRIPT_ALIASES].key(res)
    end

    def self.script_extensions(string, format: :long)
      require_relative 'scripts/index' unless defined? ::Unicode::Scripts::INDEX

      string.each_codepoint.inject([]){ |res, codepoint|
        if new_scripts = INDEX[:SCRIPT_EXTENSIONS][codepoint]
          script_extension_names = new_scripts.map{ |new_script|
            format == :long ? INDEX[:SCRIPT_NAMES][new_script] : INDEX[:SCRIPT_ALIASES].key(new_script)
          }
        else
          script_extension_names = scripts([codepoint].pack("U"), format: format)
        end

        res | script_extension_names
      }.sort
    end

    def self.names(format: :long)
      require_relative 'scripts/index' unless defined? ::Unicode::Scripts::INDEX
      format == :long ?
          INDEX[:SCRIPT_NAMES].sort :
          INDEX[:SCRIPT_ALIASES].keys.sort
    end
  end
end


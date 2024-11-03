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

    def self.augmented_scripts(string)
      require_relative 'scripts/index' unless defined? ::Unicode::Scripts::INDEX

      augmented = string.each_codepoint.inject([]){ |res, codepoint|
        if new_scripts = INDEX[:SCRIPT_EXTENSIONS][codepoint]
          script_extension_names = new_scripts.map{ |new_script|
            INDEX[:SCRIPT_ALIASES].key(new_script)
          }
        else
          script_extension_names = scripts([codepoint].pack("U"), format: :short)
        end

        res | script_extension_names
      }

      if augmented.include? "Hani"
        augmented |= ["Hanb", "Jpan", "Kore"]
      end
      if augmented.include?("Hira") || augmented.include?("Kana")
        augmented |= ["Jpan"]
      end
      if augmented.include? "Hang"
        augmented |= ["Kore"]
      end
      if augmented.include? "Bopo"
        augmented |= ["Hanb"]
      end
      if augmented.include?("Zyyy") || augmented.include?("Zinh")
        augmented |= names(format: :short, augmented: :include )
      end
    
      augmented.sort
    end

    def self.resolved_scripts(string)
      string.chars.reduce(
        Unicode::Scripts.names(format: :short, augmented: :include)
      ){ |acc, char|
        acc & augmented_scripts(char)
      }
    end

    def self.mixed?(string)
      resolved_scripts(string).empty?
    end

    def self.single?(string)
      !resolved_scripts(string).empty?
    end

    # Lists scripts. Options:
    # - format - :long, :short
    # - augmented - :include, :exclude, :only
    def self.names(format: :long, augmented: :exclude)
      if format == :long && augmented != :exclude
        raise ArgumentError, "only short four-letter script codes (ISO 15924) supported when listing augmented scripts"
      end

      if augmented == :only
        return AUGMENTED_SCRIPT_CODES
      end

      require_relative 'scripts/index' unless defined? ::Unicode::Scripts::INDEX

      if format == :long
        INDEX[:SCRIPT_NAMES].sort
      elsif augmented == :exclude
        INDEX[:SCRIPT_ALIASES].keys.sort
      else
        (INDEX[:SCRIPT_ALIASES].keys + AUGMENTED_SCRIPT_CODES).sort
      end
    end
  end
end


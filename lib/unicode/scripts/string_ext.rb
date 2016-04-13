require_relative "../scripts"

class String
  # Optional string extension for your convenience
  def unicode_scripts
    Unicode::Scripts.scripts(self)
  end

  def unicode_script_extensions
    Unicode::Scripts.script_extensions(self)
  end
end

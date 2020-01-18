require_relative "../lib/unicode/scripts"
require "minitest/autorun"

describe Unicode::Scripts do
  describe ".scripts (alias .of)" do
    it "will always return an Array" do
      assert_equal [], Unicode::Scripts.of("")
    end

    it "will return all scripts that characters in the string belong to" do
      assert_equal ["Cyrillic", "Latin"], Unicode::Scripts.of("СC")
    end

    it "will return all scripts in sorted order" do
      assert_equal ["Cyrillic", "Latin"], Unicode::Scripts.of("СA")
      assert_equal ["Cyrillic", "Latin"], Unicode::Scripts.of("AС")
    end

    it "will call .script for every character" do
      mocked_method = MiniTest::Mock.new
      if RUBY_VERSION >= "2.7"
        mocked_method.expect :call, "first script",  ["С"]
        mocked_method.expect :call, "second script", ["A"]
      else
        mocked_method.expect :call, "first script",  ["С", {}]
        mocked_method.expect :call, "second script", ["A", {}]
      end
      Unicode::Scripts.stub :script, mocked_method do
        Unicode::Scripts.of("СA")
      end
      mocked_method.verify
    end
  end

  describe ".script" do
    it "will return script for that character" do
      assert_equal "Greek", Unicode::Scripts.script("ᴦ")
      assert_equal "Common", Unicode::Scripts.script("�")
    end

    it "will return Unknown for characters not in any script" do
      assert_equal "Unknown", Unicode::Scripts.script("\u{10c50}")
    end

    it "will return 4 letter script codes with format: :short" do
      assert_equal ["Cyrl", "Latn"], Unicode::Scripts.of("СC", format: :short)
    end
  end

  describe ".script_extensions" do
    it "will always return an Array" do
      assert_equal [], Unicode::Scripts.script_extensions("")
    end

    it "will return all extended scripts that characters in the string belong to" do
      assert_equal [
        "Bengali",
        "Devanagari",
        "Dogra",
        "Grantha",
        "Gujarati",
        "Gunjala_Gondi",
        "Gurmukhi",
        "Kannada",
        "Khudawadi",
        "Limbu",
        "Mahajani",
        "Malayalam",
        "Masaram_Gondi",
        "Nandinagari",
        "Oriya",
        "Sinhala",
        "Syloti_Nagri",
        "Takri",
        "Tamil",
        "Telugu",
        "Tirhuta"
      ], Unicode::Scripts.script_extensions("॥")
    end

    it "will return 4 letter script codes with format: :short" do
      assert_equal [
        "Beng",
        "Deva",
        "Dogr",
        "Gong",
        "Gonm",
        "Gran",
        "Gujr",
        "Guru",
        "Knda",
        "Limb",
        "Mahj",
        "Mlym",
        "Nand",
        "Orya",
        "Sind",
        "Sinh",
        "Sylo",
        "Takr",
        "Taml",
        "Telu",
        "Tirh"
      ], Unicode::Scripts.script_extensions("॥", format: :short)

    end

    it "will return all extended scripts in sorted order" do
      assert_equal ["Cyrillic", "Latin"], Unicode::Scripts.script_extensions("СA")
      assert_equal ["Cyrillic", "Latin"], Unicode::Scripts.script_extensions("AС")
    end

    it "will call .scripts for characters that have no explicit script extension" do
      mocked_method = MiniTest::Mock.new
      mocked_method.expect :call, ["scripts"],  ["A", {format: :long}]
      Unicode::Scripts.stub :scripts, mocked_method do
        Unicode::Scripts.script_extensions("A")
      end
      mocked_method.verify
    end
  end

  describe ".names" do
    it "will return a list of all script names" do
      assert_kind_of Array, Unicode::Scripts.names
      assert_includes Unicode::Scripts.names, "Inscriptional_Parthian"
    end
  end
end


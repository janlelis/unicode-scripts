# Unicode::Scripts [![[version]](https://badge.fury.io/rb/unicode-scripts.svg)](https://badge.fury.io/rb/unicode-scripts)  [![[ci]](https://github.com/janlelis/unicode-scripts/workflows/Test/badge.svg)](https://github.com/janlelis/unicode-scripts/actions?query=workflow%3ATest)

Retrieve all [Unicode script(s)](https://en.wikipedia.org/wiki/Script_%28Unicode%29) a string belongs to. Can also return the *Script_Extension* property (scx) which is defined as characters which are "commonly used with more than one script, but with a limited number of scripts".

Based on the *Script_Extension*, this library can also return the [augmented script set](https://www.unicode.org/reports/tr39/#def-augmented-script-set) to figure out if a string is **mixed-script** or **single-script**. Mixed scripts can be an indicator of suspicious user inputs.

Unicode version: **16.0.0** (September 2024)

Supported Rubies: **3.x** (might work: **2.x**)

## Gemfile

```ruby
gem "unicode-scripts"
```

## Usage - Scripts and Script Extensions

```ruby
require "unicode/scripts"

Unicode::Scripts.scripts("СC") # => ["Cyrillic", "Latin"]

# 4 letter script aliases
Unicode::Scripts.scripts("СC", format: :short) # => ["Cyrl", "Latn"]

# Single character
Unicode::Scripts.script("ᴦ") # => "Greek"

# Script_Extension property
Unicode::Scripts.script_extensions("॥")
# => ["Bengali", "Devanagari", "Dogra", "Grantha", "Gujarati", "Gunjala_Gondi", "Gurmukhi","Gurung_Khema",
      "Kannada","Khudawadi",  "Limbu",  "Mahajani",  "Malayalam", "Masaram_Gondi", "Nandinagari", "Ol_Onal",
      "Oriya", "Sinhala", "Syloti_Nagri", "Takri", "Tamil", "Telugu", "Tirhuta"]
```

## Usage - Augmented Scripts

Like script extensions, but adds meta scripts for Asian languages and treats _Common_/_Inherited_ values as ALL scripts.

```ruby
require "unicode/scripts"

Unicode::Scripts.augmented_scripts("ねガ") # => ['Hira', 'Kana', 'Jpan']
Unicode::Scripts.augmented_scripts("1") # => ["Adlm", "Aghb", "Ahom", … ]
```

## Usage - Resolved Script

Intersection of all augmented scripts per character.

```ruby
require "unicode/scripts"

Unicode::Scripts.resolved_scripts("СігсӀе") # =>  [ 'Cyrl' ]
Unicode::Scripts.resolved_scripts("Сirсlе") # =>  []
Unicode::Scripts.resolved_scripts("𝖢𝗂𝗋𝖼𝗅𝖾") # => ['Adlm', 'Aghb', 'Ahom', … ]
Unicode::Scripts.resolved_scripts("1") # => ['Adlm','Aghb', 'Ahom', … ]
Unicode::Scripts.resolved_scripts("ねガ") # =>  ['Hira', 'Kana', 'Jpan']
```

Please note that the **resolved script** can contain multiple scripts, as per standard.

## Usage - Mixed-Script Detection

Mixed-script if resolved script set is empty, single-script otherwise.

```ruby
require "unicode/scripts"

Unicode::Scripts.mixed?("СігсӀе"); # => false
Unicode::Scripts.mixed?("Сirсlе"); # => true
Unicode::Scripts.mixed?("𝖢𝗂𝗋𝖼𝗅𝖾"); # => false
Unicode::Scripts.mixed?("1"); # => false
Unicode::Scripts.mixed?("ねガ"); # => false

Unicode::Scripts.single?("СігсӀе"); # => true
Unicode::Scripts.single?("Сirсlе"); # => false
Unicode::Scripts.single?("𝖢𝗂𝗋𝖼𝗅𝖾"); # => true
Unicode::Scripts.single?("1"); # => true
Unicode::Scripts.single?("ねガ"); # => true
```

Please note that a **single-script** string might actually contain multiple scripts, as per standard (e.g. for Asian languages)

### List of All Scripts

You can extract all script names from the gem like this:

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names # list of scripts
```

To get all 4 letter script codes (ISO 15924):

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names(format: :short) # list of scripts
```

Augmented scripts: 

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names(format: :short, augmented: :only)
```

You can find a list of all scripts in Unicode, with links to Wikipedia on [character.construction/scripts](https://character.construction/scripts)

## Hints
### Regex Matching

If you have a string and want to match a substring/character from a specific Unicode script, you actually won't need this gem. Instead, you can use the [Regexp Unicode Property Syntax `\p{}`](https://ruby-doc.org/core/Regexp.html#class-Regexp-label-Character+Properties):

```ruby
"Coptic letter: ⲁ".scan(/\p{Coptic}/) # => ["ⲁ"]
```

See [Idiosyncratic Ruby: Proper Unicoding](https://idiosyncratic-ruby.com/41-proper-unicoding.html) for more info.

## Also See

- JavaScript implementation (same data & algorithms): [unicode-script.js](https://github.com/janlelis/unicode-script.js)
- Index created with: [unicoder](https://github.com/janlelis/unicoder)
- Get the Unicode blocks of a string: [unicode-blocks gem](https://github.com/janlelis/unicode-blocks)
- See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries for Ruby.

## MIT License

- Copyright (C) 2016-2024 Jan Lelis <https://janlelis.com>. Released under the MIT license.
- Unicode data: https://www.unicode.org/copyright.html#Exhibit1

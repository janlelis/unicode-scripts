# Unicode::Scripts [![[version]](https://badge.fury.io/rb/unicode-scripts.svg)](http://badge.fury.io/rb/unicode-scripts)  [![[travis]](https://travis-ci.org/janlelis/unicode-scripts.png)](https://travis-ci.org/janlelis/unicode-scripts)

Retrieve the [Unicode script(s)](https://en.wikipedia.org/wiki/Script_%28Unicode%29) a string belongs to. Can also return the *Script_Extension* property which is defined as characters which are "commonly used with more than one script, but with a limited number of scripts".

Unicode version: **8.0.0**

Supported Rubies: **2.3**, **2.2**, **2.1**

## Gemfile

```ruby
gem "unicode-scripts"
```

## Usage

```ruby
require "unicode/scripts"

Unicode::Scripts.scripts("СC") # => ["Cyrillic", "Latin"]

# 4 letter script aliases
Unicode::Scripts.scripts("СC", format: :short) # => ["Cyrl", "Latn"]

# Single character
Unicode::Scripts.script("ᴦ") # => "Greek"

# Script_Extension property
Unicode::Scripts.script_extensions("॥") # => ["Bengali", "Devanagari", "Grantha", "Gujarati",
                                              "Gurmukhi", "Kannada", "Khudawadi", "Limbu",
                                              "Mahajani", "Malayalam", "Oriya", "Sinhala",
                                              "Syloti_Nagri", "Takri", "Tamil", "Telugu",
                                              "Tirhuta"]
```

## Hints
### Regex Matching

If you have a string and want to match a substring/character from a specific Unicode script, you actually won't need this gem. Instead, you can use the [Regexp Unicode Property Syntax `\p{}`](http://ruby-doc.org/core-2.3.0/Regexp.html#class-Regexp-label-Character+Properties):

```ruby
"Coptic letter: ⲁ".scan(/\p{Coptic}/) # => ["ⲁ"]
```

### Script Names

You can extract all script names from the gem like this:

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names

# # # Output # # #

Caucasian_Albanian
Ahom
Arabic
Imperial_Aramaic
Armenian
Avestan
Balinese
Bamum
Bassa_Vah
Batak
Bengali
Bopomofo
Brahmi
Braille
Buginese
Buhid
Chakma
Canadian_Aboriginal
Carian
Cham
Cherokee
Coptic
Cypriot
Cyrillic
Devanagari
Deseret
Duployan
Egyptian_Hieroglyphs
Elbasan
Ethiopic
Georgian
Glagolitic
Gothic
Grantha
Greek
Gujarati
Gurmukhi
Hangul
Han
Hanunoo
Hatran
Hebrew
Hiragana
Anatolian_Hieroglyphs
Pahawh_Hmong
Katakana_Or_Hiragana
Old_Hungarian
Old_Italic
Javanese
Kayah_Li
Katakana
Kharoshthi
Khmer
Khojki
Kannada
Kaithi
Tai_Tham
Lao
Latin
Lepcha
Limbu
Linear_A
Linear_B
Lisu
Lycian
Lydian
Mahajani
Mandaic
Manichaean
Mende_Kikakui
Meroitic_Cursive
Meroitic_Hieroglyphs
Malayalam
Modi
Mongolian
Mro
Meetei_Mayek
Multani
Myanmar
Old_North_Arabian
Nabataean
Nko
Ogham
Ol_Chiki
Old_Turkic
Oriya
Osmanya
Palmyrene
Pau_Cin_Hau
Old_Permic
Phags_Pa
Inscriptional_Pahlavi
Psalter_Pahlavi
Phoenician
Miao
Inscriptional_Parthian
Rejang
Runic
Samaritan
Old_South_Arabian
Saurashtra
SignWriting
Shavian
Sharada
Siddham
Khudawadi
Sinhala
Sora_Sompeng
Sundanese
Syloti_Nagri
Syriac
Tagbanwa
Takri
Tai_Le
New_Tai_Lue
Tamil
Tai_Viet
Telugu
Tifinagh
Tagalog
Thaana
Thai
Tibetan
Tirhuta
Ugaritic
Vai
Warang_Citi
Old_Persian
Cuneiform
Yi
Inherited
Common
Unknown
```

### Short Script Names

You can extract all 4 letter script names from the gem like this:

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names(format: :short)

# # # Output # # #

Aghb
Ahom
Arab
Armi
Armn
Avst
Bali
Bamu
Bass
Batk
Beng
Bopo
Brah
Brai
Bugi
Buhd
Cakm
Cans
Cari
Cham
Cher
Copt
Qaac
Cprt
Cyrl
Deva
Dsrt
Dupl
Egyp
Elba
Ethi
Geor
Glag
Goth
Gran
Grek
Gujr
Guru
Hang
Hani
Hano
Hatr
Hebr
Hira
Hluw
Hmng
Hrkt
Hung
Ital
Java
Kali
Kana
Khar
Khmr
Khoj
Knda
Kthi
Lana
Laoo
Latn
Lepc
Limb
Lina
Linb
Lisu
Lyci
Lydi
Mahj
Mand
Mani
Mend
Merc
Mero
Mlym
Modi
Mong
Mroo
Mtei
Mult
Mymr
Narb
Nbat
Nkoo
Ogam
Olck
Orkh
Orya
Osma
Palm
Pauc
Perm
Phag
Phli
Phlp
Phnx
Plrd
Prti
Rjng
Runr
Samr
Sarb
Saur
Sgnw
Shaw
Shrd
Sidd
Sind
Sinh
Sora
Sund
Sylo
Syrc
Tagb
Takr
Tale
Talu
Taml
Tavt
Telu
Tfng
Tglg
Thaa
Thai
Tibt
Tirh
Ugar
Vaii
Wara
Xpeo
Xsux
Yiii
Zinh
Qaai
Zyyy
Zzzz
```

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
- Unicode data: http://www.unicode.org/copyright.html#Exhibit1

# Unicode::Scripts [![[version]](https://badge.fury.io/rb/unicode-scripts.svg)](http://badge.fury.io/rb/unicode-scripts)  [![[travis]](https://travis-ci.org/janlelis/unicode-scripts.png)](https://travis-ci.org/janlelis/unicode-scripts)

Retrieve the [Unicode script(s)](https://en.wikipedia.org/wiki/Script_%28Unicode%29) a string belongs to. Can also return the *Script_Extension* property which is defined as characters which are "commonly used with more than one script, but with a limited number of scripts".

Unicode version: **10.0.0**

Supported Rubies: **2.5**, **2.4**, **2.3**, **2.2**

Old Rubies that might still work: **2.1**, **2.0**

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

Adlam
Ahom
Anatolian_Hieroglyphs
Arabic
Armenian
Avestan
Balinese
Bamum
Bassa_Vah
Batak
Bengali
Bhaiksuki
Bopomofo
Brahmi
Braille
Buginese
Buhid
Canadian_Aboriginal
Carian
Caucasian_Albanian
Chakma
Cham
Cherokee
Common
Coptic
Cuneiform
Cypriot
Cyrillic
Deseret
Devanagari
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
Han
Hangul
Hanunoo
Hatran
Hebrew
Hiragana
Imperial_Aramaic
Inherited
Inscriptional_Pahlavi
Inscriptional_Parthian
Javanese
Kaithi
Kannada
Katakana
Katakana_Or_Hiragana
Kayah_Li
Kharoshthi
Khmer
Khojki
Khudawadi
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
Malayalam
Mandaic
Manichaean
Marchen
Masaram_Gondi
Meetei_Mayek
Mende_Kikakui
Meroitic_Cursive
Meroitic_Hieroglyphs
Miao
Modi
Mongolian
Mro
Multani
Myanmar
Nabataean
New_Tai_Lue
Newa
Nko
Nushu
Ogham
Ol_Chiki
Old_Hungarian
Old_Italic
Old_North_Arabian
Old_Permic
Old_Persian
Old_South_Arabian
Old_Turkic
Oriya
Osage
Osmanya
Pahawh_Hmong
Palmyrene
Pau_Cin_Hau
Phags_Pa
Phoenician
Psalter_Pahlavi
Rejang
Runic
Samaritan
Saurashtra
Sharada
Shavian
Siddham
SignWriting
Sinhala
Sora_Sompeng
Soyombo
Sundanese
Syloti_Nagri
Syriac
Tagalog
Tagbanwa
Tai_Le
Tai_Tham
Tai_Viet
Takri
Tamil
Tangut
Telugu
Thaana
Thai
Tibetan
Tifinagh
Tirhuta
Ugaritic
Unknown
Vai
Warang_Citi
Yi
Zanabazar_Square
```

### Short Script Names

You can extract all 4 letter script names from the gem like this:

```ruby
require "unicode/scripts"
puts Unicode::Scripts.names(format: :short)

# # # Output # # #

Adlm
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
Bhks
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
Gonm
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
Marc
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
Newa
Nkoo
Nshu
Ogam
Olck
Orkh
Orya
Osge
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
Qaac
Qaai
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
Soyo
Sund
Sylo
Syrc
Tagb
Takr
Tale
Talu
Taml
Tang
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
Zanb
Zinh
Zyyy
Zzzz
```

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
- Unicode data: http://www.unicode.org/copyright.html#Exhibit1

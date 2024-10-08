# Unicode::Scripts [![[version]](https://badge.fury.io/rb/unicode-scripts.svg)](https://badge.fury.io/rb/unicode-scripts)  [![[ci]](https://github.com/janlelis/unicode-scripts/workflows/Test/badge.svg)](https://github.com/janlelis/unicode-scripts/actions?query=workflow%3ATest)

Retrieve the [Unicode script(s)](https://en.wikipedia.org/wiki/Script_%28Unicode%29) a string belongs to. Can also return the *Script_Extension* property which is defined as characters which are "commonly used with more than one script, but with a limited number of scripts".

Unicode version: **16.0.0** (September 2024)

Supported Rubies: **3.3**, **3.2**, **3.1**, **3.0**

Old Rubies that might still work: **2.7**, **2.6**, **2.5**, **2.4**, **2.3**, **2.X**

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
Unicode::Scripts.script_extensions("॥")
# => ["Bengali", "Devanagari", "Dogra", "Grantha", "Gujarati", "Gunjala_Gondi", "Gurmukhi","Gurung_Khema",
      "Kannada","Khudawadi",  "Limbu",  "Mahajani",  "Malayalam", "Masaram_Gondi", "Nandinagari", "Ol_Onal",
      "Oriya", "Sinhala", "Syloti_Nagri", "Takri", "Tamil", "Telugu", "Tirhuta"]
```

## Hints
### Regex Matching

If you have a string and want to match a substring/character from a specific Unicode script, you actually won't need this gem. Instead, you can use the [Regexp Unicode Property Syntax `\p{}`](https://ruby-doc.org/core/Regexp.html#class-Regexp-label-Character+Properties):

```ruby
"Coptic letter: ⲁ".scan(/\p{Coptic}/) # => ["ⲁ"]
```

See [Idiosyncratic Ruby: Proper Unicoding](https://idiosyncratic-ruby.com/41-proper-unicoding.html) for more info.

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
Chorasmian
Common
Coptic
Cuneiform
Cypriot
Cypro_Minoan
Cyrillic
Deseret
Devanagari
Dives_Akuru
Dogra
Duployan
Egyptian_Hieroglyphs
Elbasan
Elymaic
Ethiopic
Garay
Georgian
Glagolitic
Gothic
Grantha
Greek
Gujarati
Gunjala_Gondi
Gurmukhi
Gurung_Khema
Han
Hangul
Hanifi_Rohingya
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
Kawi
Kayah_Li
Kharoshthi
Khitan_Small_Script
Khmer
Khojki
Khudawadi
Kirat_Rai
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
Makasar
Malayalam
Mandaic
Manichaean
Marchen
Masaram_Gondi
Medefaidrin
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
Nag_Mundari
Nandinagari
New_Tai_Lue
Newa
Nko
Nushu
Nyiakeng_Puachue_Hmong
Ogham
Ol_Chiki
Ol_Onal
Old_Hungarian
Old_Italic
Old_North_Arabian
Old_Permic
Old_Persian
Old_Sogdian
Old_South_Arabian
Old_Turkic
Old_Uyghur
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
Sogdian
Sora_Sompeng
Soyombo
Sundanese
Sunuwar
Syloti_Nagri
Syriac
Tagalog
Tagbanwa
Tai_Le
Tai_Tham
Tai_Viet
Takri
Tamil
Tangsa
Tangut
Telugu
Thaana
Thai
Tibetan
Tifinagh
Tirhuta
Todhri
Toto
Tulu_Tigalari
Ugaritic
Unknown
Vai
Vithkuqi
Wancho
Warang_Citi
Yezidi
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
Chrs
Copt
Cpmn
Cprt
Cyrl
Deva
Diak
Dogr
Dsrt
Dupl
Egyp
Elba
Elym
Ethi
Gara
Geor
Glag
Gong
Gonm
Goth
Gran
Grek
Gujr
Gukh
Guru
Hang
Hani
Hano
Hatr
Hebr
Hira
Hluw
Hmng
Hmnp
Hrkt
Hung
Ital
Java
Kali
Kana
Kawi
Khar
Khmr
Khoj
Kits
Knda
Krai
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
Maka
Mand
Mani
Marc
Medf
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
Nagm
Nand
Narb
Nbat
Newa
Nkoo
Nshu
Ogam
Olck
Onao
Orkh
Orya
Osge
Osma
Ougr
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
Rohg
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
Sogd
Sogo
Sora
Soyo
Sund
Sunu
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
Tnsa
Todr
Toto
Tutg
Ugar
Vaii
Vith
Wara
Wcho
Xpeo
Xsux
Yezi
Yiii
Zanb
Zinh
Zyyy
Zzzz
```

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016-2024 Jan Lelis <https://janlelis.com>. Released under the MIT license.
- Unicode data: https://www.unicode.org/copyright.html#Exhibit1

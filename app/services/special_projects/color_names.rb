module SpecialProjects
    class ColorNames
        attr_accessor :res, :res2

        def initialize
              tmp = color_by_names.gsub("\n",",").gsub(/Mix|Shades/,"").gsub(" ","").gsub("#", " #").gsub(","," ").split
              @res = Hash[*tmp]
              tmp2 = color_by_groups.scan(/(.*Colors)([\w\W]*?)(?:(?=\w* Colors))/).each{|group| group[1] = Hash[*group[1].scan(/[#\w]+/)]}
              @res2 = Hash[*tmp2.flatten]
        end

        def color_by_names
              #Color Name 	HEX
              "
              AliceBlue  	#F0F8FF
              AntiqueWhite  	#FAEBD7
              Aqua  	#00FFFF
              Aquamarine  	#7FFFD4
              Azure  	#F0FFFF
              Beige  	#F5F5DC
              Bisque  	#FFE4C4
              Black  	#000000
              BlanchedAlmond  	#FFEBCD
              Blue  	#0000FF
              BlueViolet  	#8A2BE2
              Brown  	#A52A2A
              BurlyWood  	#DEB887
              CadetBlue  	#5F9EA0
              Chartreuse  	#7FFF00
              Chocolate  	#D2691E
              Coral  	#FF7F50
              CornflowerBlue  	#6495ED
              Cornsilk  	#FFF8DC
              Crimson  	#DC143C
              Cyan  	#00FFFF
              DarkBlue  	#00008B
              DarkCyan  	#008B8B
              DarkGoldenRod  	#B8860B
              DarkGray  	#A9A9A9
              DarkGrey  	#A9A9A9
              DarkGreen  	#006400
              DarkKhaki  	#BDB76B
              DarkMagenta  	#8B008B
              DarkOliveGreen  	#556B2F
              DarkOrange  	#FF8C00
              DarkOrchid  	#9932CC
              DarkRed  	#8B0000
              DarkSalmon  	#E9967A
              DarkSeaGreen  	#8FBC8F
              DarkSlateBlue  	#483D8B
              DarkSlateGray  	#2F4F4F
              DarkSlateGrey  	#2F4F4F
              DarkTurquoise  	#00CED1
              DarkViolet  	#9400D3
              DeepPink  	#FF1493
              DeepSkyBlue  	#00BFFF
              DimGray  	#696969
              DimGrey  	#696969
              DodgerBlue  	#1E90FF
              FireBrick  	#B22222
              FloralWhite  	#FFFAF0
              ForestGreen  	#228B22
              Fuchsia  	#FF00FF
              Gainsboro  	#DCDCDC
              GhostWhite  	#F8F8FF
              Gold  	#FFD700
              GoldenRod  	#DAA520
              Gray  	#808080
              Grey  	#808080
              Green  	#008000
              GreenYellow  	#ADFF2F
              HoneyDew  	#F0FFF0
              HotPink  	#FF69B4
              IndianRed   	#CD5C5C
              Indigo   	#4B0082
              Ivory  	#FFFFF0
              Khaki  	#F0E68C
              Lavender  	#E6E6FA
              LavenderBlush  	#FFF0F5
              LawnGreen  	#7CFC00
              LemonChiffon  	#FFFACD
              LightBlue  	#ADD8E6
              LightCoral  	#F08080
              LightCyan  	#E0FFFF
              LightGoldenRodYellow  	#FAFAD2
              LightGray  	#D3D3D3
              LightGrey  	#D3D3D3
              LightGreen  	#90EE90
              LightPink  	#FFB6C1
              LightSalmon  	#FFA07A
              LightSeaGreen  	#20B2AA
              LightSkyBlue  	#87CEFA
              LightSlateGray  	#778899
              LightSlateGrey  	#778899
              LightSteelBlue  	#B0C4DE
              LightYellow  	#FFFFE0
              Lime  	#00FF00
              LimeGreen  	#32CD32
              Linen  	#FAF0E6
              Magenta  	#FF00FF
              Maroon  	#800000
              MediumAquaMarine  	#66CDAA
              MediumBlue  	#0000CD
              MediumOrchid  	#BA55D3
              MediumPurple  	#9370DB
              MediumSeaGreen  	#3CB371
              MediumSlateBlue  	#7B68EE
              MediumSpringGreen  	#00FA9A
              MediumTurquoise  	#48D1CC
              MediumVioletRed  	#C71585
              MidnightBlue  	#191970
              MintCream  	#F5FFFA
              MistyRose  	#FFE4E1
              Moccasin  	#FFE4B5
              NavajoWhite  	#FFDEAD
              Navy  	#000080
              OldLace  	#FDF5E6
              Olive  	#808000
              OliveDrab  	#6B8E23
              Orange  	#FFA500
              OrangeRed  	#FF4500
              Orchid  	#DA70D6
              PaleGoldenRod  	#EEE8AA
              PaleGreen  	#98FB98
              PaleTurquoise  	#AFEEEE
              PaleVioletRed  	#DB7093
              PapayaWhip  	#FFEFD5
              PeachPuff  	#FFDAB9
              Peru  	#CD853F
              Pink  	#FFC0CB
              Plum  	#DDA0DD
              PowderBlue  	#B0E0E6
              Purple  	#800080
              RebeccaPurple  	#663399
              Red  	#FF0000
              RosyBrown  	#BC8F8F
              RoyalBlue  	#4169E1
              SaddleBrown  	#8B4513
              Salmon  	#FA8072
              SandyBrown  	#F4A460
              SeaGreen  	#2E8B57
              SeaShell  	#FFF5EE
              Sienna  	#A0522D
              Silver  	#C0C0C0
              SkyBlue  	#87CEEB
              SlateBlue  	#6A5ACD
              SlateGray  	#708090
              SlateGrey  	#708090
              Snow  	#FFFAFA
              SpringGreen  	#00FF7F
              SteelBlue  	#4682B4
              Tan  	#D2B48C
              Teal  	#008080
              Thistle  	#D8BFD8
              Tomato  	#FF6347
              Turquoise  	#40E0D0
              Violet  	#EE82EE
              Wheat  	#F5DEB3
              White  	#FFFFFF
              WhiteSmoke  	#F5F5F5
              Yellow  	#FFFF00
              YellowGreen  	#9ACD32"
        end

        def color_by_groups
              "
              Pink Colors
              Color_Name Hex
              Pink  	#FFC0CB
              LightPink  	#FFB6C1
              HotPink  	#FF69B4
              DeepPink  	#FF1493
              PaleVioletRed  	#DB7093
              MediumVioletRed  	#C71585


              Purple Colors
              Color_Name 	HEX
              Lavender  	#E6E6FA
              Thistle  	#D8BFD8
              Plum  	#DDA0DD
              Orchid  	#DA70D6
              Violet  	#EE82EE
              Fuchsia  	#FF00FF
              Magenta  	#FF00FF
              MediumOrchid  	#BA55D3
              DarkOrchid  	#9932CC
              DarkViolet  	#9400D3
              BlueViolet  	#8A2BE2
              DarkMagenta  	#8B008B
              Purple  	#800080
              MediumPurple  	#9370DB
              MediumSlateBlue  	#7B68EE
              SlateBlue  	#6A5ACD
              DarkSlateBlue  	#483D8B
              RebeccaPurple  	#663399
              Indigo   	#4B0082


              Red Colors
              Color_Name 	HEX
              LightSalmon  	#FFA07A
              Salmon  	#FA8072
              DarkSalmon  	#E9967A
              LightCoral  	#F08080
              IndianRed   	#CD5C5C
              Crimson  	#DC143C
              Red  	#FF0000
              FireBrick  	#B22222
              DarkRed  	#8B0000


              Orange Colors
              Color_Name 	HEX
              Orange  	#FFA500
              DarkOrange  	#FF8C00
              Coral  	#FF7F50
              Tomato  	#FF6347
              OrangeRed  	#FF4500


              Yellow Colors
              Color_Name 	HEX
              Gold  	#FFD700
              Yellow  	#FFFF00
              LightYellow  	#FFFFE0
              LemonChiffon  	#FFFACD
              LightGoldenRodYellow  	#FAFAD2
              PapayaWhip  	#FFEFD5
              Moccasin  	#FFE4B5
              PeachPuff  	#FFDAB9
              PaleGoldenRod  	#EEE8AA
              Khaki  	#F0E68C
              DarkKhaki  	#BDB76B


              Green Colors
              Color_Name 	HEX
              GreenYellow  	#ADFF2F
              Chartreuse  	#7FFF00
              LawnGreen  	#7CFC00
              Lime  	#00FF00
              LimeGreen  	#32CD32
              PaleGreen  	#98FB98
              LightGreen  	#90EE90
              MediumSpringGreen  	#00FA9A
              SpringGreen  	#00FF7F
              MediumSeaGreen  	#3CB371
              SeaGreen  	#2E8B57
              ForestGreen  	#228B22
              Green  	#008000
              DarkGreen  	#006400
              YellowGreen  	#9ACD32
              OliveDrab  	#6B8E23
              DarkOliveGreen  	#556B2F
              MediumAquaMarine  	#66CDAA
              DarkSeaGreen  	#8FBC8F
              LightSeaGreen  	#20B2AA
              DarkCyan  	#008B8B
              Teal  	#008080


              Cyan Colors
              Color_Name 	HEX
              Aqua  	#00FFFF
              Cyan  	#00FFFF
              LightCyan  	#E0FFFF
              PaleTurquoise  	#AFEEEE
              Aquamarine  	#7FFFD4
              Turquoise  	#40E0D0
              MediumTurquoise  	#48D1CC
              DarkTurquoise  	#00CED1

              Blue Colors
              Color_Name 	HEX
              CadetBlue  	#5F9EA0
              SteelBlue  	#4682B4
              LightSteelBlue  	#B0C4DE
              LightBlue  	#ADD8E6
              PowderBlue  	#B0E0E6
              LightSkyBlue  	#87CEFA
              SkyBlue  	#87CEEB
              CornflowerBlue  	#6495ED
              DeepSkyBlue  	#00BFFF
              DodgerBlue  	#1E90FF
              RoyalBlue  	#4169E1
              Blue  	#0000FF
              MediumBlue  	#0000CD
              DarkBlue  	#00008B
              Navy  	#000080
              MidnightBlue  	#191970


              Brown Colors
              Color_Name 	HEX
              Cornsilk  	#FFF8DC
              BlanchedAlmond  	#FFEBCD
              Bisque  	#FFE4C4
              NavajoWhite  	#FFDEAD
              Wheat  	#F5DEB3
              BurlyWood  	#DEB887
              Tan  	#D2B48C
              RosyBrown  	#BC8F8F
              SandyBrown  	#F4A460
              GoldenRod  	#DAA520
              DarkGoldenRod  	#B8860B
              Peru  	#CD853F
              Chocolate  	#D2691E
              Olive  	#808000
              SaddleBrown  	#8B4513
              Sienna  	#A0522D
              Brown  	#A52A2A
              Maroon  	#800000


              White Colors
              Color_Name 	HEX
              White  	#FFFFFF
              Snow  	#FFFAFA
              HoneyDew  	#F0FFF0
              MintCream  	#F5FFFA
              Azure  	#F0FFFF
              AliceBlue  	#F0F8FF
              GhostWhite  	#F8F8FF
              WhiteSmoke  	#F5F5F5
              SeaShell  	#FFF5EE
              Beige  	#F5F5DC
              OldLace  	#FDF5E6
              FloralWhite  	#FFFAF0
              Ivory  	#FFFFF0
              AntiqueWhite  	#FAEBD7
              Linen  	#FAF0E6
              LavenderBlush  	#FFF0F5
              MistyRose  	#FFE4E1

              Grey Colors
              Color_Name 	HEX
              Gainsboro  	#DCDCDC
              LightGray  	#D3D3D3
              Silver  	#C0C0C0
              DarkGray  	#A9A9A9
              DimGray  	#696969
              Gray  	#808080
              LightSlateGray  	#778899
              SlateGray  	#708090
              DarkSlateGray  	#2F4F4F
              Black  	#000000

              End Colors"
        end
    end
end

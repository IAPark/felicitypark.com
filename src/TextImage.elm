module TextImage exposing (rawData, heroImage)

import Html exposing (Html, span, div, text)
import Html.Attributes exposing (..)
import String exposing (trim)
import Random

seed = Random.initialSeed 0

--  a function that takes an int and a bool and returns an Html msg

heroImage  width faided = div [
        class "ascii-logo",
        classList [ ("faded", faided) ],
        style "width" (String.fromInt(width) ++ "px"),
        style "fontSize" (String.fromInt(width // 50)  ++ "px")
    ] (
        let
            (randomClasses, newSeed) = Random.step (Random.list (String.length rawData) (Random.uniform "a" ["b"])) seed
        in
            (List.map2 (\c className -> span [class className] [text (String.fromChar c)]) (String.toList rawData) randomClasses)
    )

rawData : String
rawData = trim """
llodxkdlc:coollooooololllcllllooooxkkxdxkkxO0OkOO000XWWWWWWMWKkxxkxxkOl.,;;';l;,lollccccccccccccc:::
llolllllc:ccccoooooooodoolclllloooodxkxxkxxkOkkkOOOOKNWWWWWWMNOxxkxxkOl';;;':o;,oollccccccccccccc:::
dolllllll:cccloooddooddddolllloddddddxxxxddxxxxxxxkkOKXKKXNNWN0xxxxdxOl';;;,:o;;oollccccccccccccc:::
oddddollcccccldddooooddddololllooooollloolcccccllloodOKKKKKKXKxdddoodOl,:;;,co;;oollccccccccccccc:::
ccloddollccllodddddddddddoooddoooolcc:;;,''..''',;;;:loollodkkdddxddkOl;:;;,co;;oollccccccccccccc:::
clllccclllloooddddxddxxxxdoddooolc;,''........'',,'','''''',:clodxxxOOl;:;;,ld;;oollccccccccccccc:::
loolllllccclodxxxxxddxxxxddddolc;'.............'',,,,,''''',;;::codxOOl;::;;lo,;oollccccccccccccc:::
;codooooc:clloxxxxxdxxxxxdoolc:,.........''''''',,,;:;'..',,,;::cccokOocc::;oo;:dollccccccccccccc:::
;ldddddxl,cdddkkkkOkxxxxxdlc:,''......',,;;:::cccccccc:,'..';;::cc::oxxolddcdd:lxdllcccccccccccc::::
:ldddddxoldkxxO0KKX0xxxxdoc:,'......',;:clodxxxkxxxxxxdoc:,.',;:::cccldooxxcdx:okdllcccccccccccc::::
,;;:clodddxxddxkkO0kxkxdoc;''....'',;cldxkkkOOOO0000000Okxoc,';;::::ccloddocdd:oOdlcccccccccccc:::::
,,;:cloodxxxddkkkkOOxkdoc;'....'',;:ldxxkkOOOOO00000KK000Okxl;,;;::;:cclodolxd:dOdlccccccccccc::::::
;;;:coooodddddkO0Oxxxdol:'.....';clodxxkkOOOOO000000KKKKK00Oxl:;,,::;;:cloooxd:x0dlc:ccccccccc::::::
oodxxkxxolxOkxO0K0xxddl:'.....',coddxxxkkOOOOO000000KKKKKKK0Odl:;,,;;;;:loddxocx0dlc:cc:ccccc:::::::
XXWWWWNXo:OMXkxxxxkxdo:'......':oddxxxkkOOOOO000000KKKKKKKKK0kxl;,,,;::::lodxock0dlc:ccc:::c::::::::
NNMMMMWWd:0MXO0KK0Oxl:,..   ..;lodxxkkkOOOOO00000KKKKKKKKKKKK0Oxc,'',:::;:lddooO0dlc:::cc:::::::::::
0XMMMMMMx:0MXO0XXX0xc;..    .;llodddxxkkOOOOO0000K0KKKKKKKKKKK0ko;'..;c:;;coddd00dlc:::c:::::::::::;
l0WMNOONxc0MXkO0Okxl;'..   .,loloooollllodxkOO0000000OO000KKKKK0d;''.'::;;:lddx00dlc:::::::::::::::;
:o0NKdckdcONKkOOkxl;'.. ...'coodoolllcc:clodxkO00Okxxdooodxxk000kc.''',:;;;cddxOOdlc:::::::::::::::;
ooddddodoodxdkOkxo:'... ...;odolc:::ccc::cloxO0K0kxxollloxkkOO00Od,.'',;:;,:oddkkdlc:c::::::::::::;;
ooooddooodxddxkxl;,...  ..,:odddooddddoollloxO0K0kkdccc::cldxOKK0k:....,;,,;codxxdlcccc::::::::::;;;
::colclcoO0xoxxo:,....   ,:coxxxxxxxxxxddoodxO0K0OkkdooddddddxO00Oo'...';,,;:lddddocccc:::::::::;;;;
',cdl:lldOkdodoc;'.....  ,:cdxxxkkOOOOkxdoddxO0KK000OkkkkOO00000K0d,....',;;:codoolcccc:::::::::;;;;
.'cddddxk0Odool:'.. ..   .coddxxkkOOOkxdoodxkO0KKKKK00000000KKKKKOd;,'....,;:cloddocccc::::::::;;;;;
.,cdoccoxxooolc,.....     ,oddxxkkkkkxdooodkOO0KKK00O00000KKKXXXKOo:;,.  ...,ccldddoccc:::::::;;;;;;
.;lxdcclxdoolc;.......    .cdddxxxxddddooloxkO000KK0kkkOO00KKKKX0xl:;..  ...':lcoddolllc::::::;;;;;;
';cdxl:lxdooc,'........   .:dddxdoodddddoooodxxxk0000OkkkOO000KK0xdc...  .. .lollodooool::::;;;;;;;,
clldxoloxxol:''........    'odxkdlcc:cloooddddkO000000OxxxkO000KOd:...  ....,oolllodollol:::;;;;;;;,
';:ldlclodoc:''........     ;oxkxdoc;,:cloddodddxxkkkxxdddkO000O:....  ....'lddolclooollll::;;;;;;;,
:::clccclollc,,,........     ,oxxxdolc:cloxxxkxxxdxdlloolxO000Oc.  .   ...,cdkdllcccoollllc::;;;;;,,
cccllllllooolc:,'.......      'ldxxddolllooooddxxxxkkOOOkk000k;.      ..',:ldxdllccclllllcc::;;;;;,,
cclllllllooloolc;,'...         .:dxdxddddddddxxkOO000K0OOOOOl.  .   ....',:codolllcllllllcc::;;;;,,,
:clllllloooolc;;,...          . .,odxxxxkkkkkOO00KKKKK0OOkko.   ..  ....'',;:ccloollllcllcc::;;;,,,,
',,:clllooooolc:,.....        .. .codxxkkOOO00KKKKKKK0Okkkkl. .........''',,::ccoooolcllccc:;;;,,,,,
,''',;:cloooooddoc,..........  . .:looddxkkOO00K00OOkkOOOOkl'............',,:clclcllc:clc::::;;,,,,'
,,'.''',,;:lodddddl;,,,;;;,'......;looloodddxkkOOOOOOO000Okl,.............',,;;;::;;;;:c:;;;;;;,,,,'
,,'..''''',,;lddddo:;:::;'. .,'.',:looooooddxkkOOO0000000Oko:'..........''''''',;:;,,;;;;;;;;;,,,,,'
,,''''''''',,;odddoc:;...   .;::cccloddooddxxkkOO000000000Oxl:,........ ...'',,'',cc:::;;;;;;;,,,,,'
,''''''''....,:oooodl'.     .,cloolooddddddxxkkOOOO0000000OOxoc;'................:dxxdddoolc;,,,,,,'
,,''...'...';coddxxxc......  .,coddddxxdddddxkkkOOOOOO000000Okxdl;......... ....'okxxxkkkkkkxdlc;,''
,,,'....',:ldxxxkkkx;...........:oddxxxkkxxxxxxkkkkOOOO0000000Oxc'..............;xkkkxkkkkkkkOOOkdl;
,,'...';ldxxxkkkkkko'............'cdxkkkOOOOkkkkkkkkkOOO0000Odc,................cxxxxxxxxxxxkkkOO00O
''...,cdxkkkkkkOOOOo...............':okOO0K00OOkkkkkkOO0Okxl;..................'lxxxxxxxxxxxkkkOO000
'...,ldxkkOOOOOO00Ol..................,;coxkkkkkxxxxxddl:,.....................,oxxkkkkkkkkkkkOOO000
'...:oxkkOOO000000O:........................',,,,,,,'..........................;dkkkkkkkkkkkkkOO0000
...'ldxkOOO0000000k;...........................................................:xkkkkkkkkkkkkOOO000K
...'ldxkOOO0000000x,...........................................................:xkkkkkkkkkkkkOOO0000
...'lxxkOOO000000Oo'...........................................................ckkkkkkkkkkkkkOOOO000
...'lxxkOOO00000OOl............................................................ckOOkkkkkkkkkkkOOO000
.. 'lxkkOOOOOOOOOOl............................................................ckOOOOOkkkkkkkOOOO000
.. .ldxkOOOOOOOkkOl............................................................:kOOOOOOkkkkkkkOOOO00
.  .ldxkOOOOOOkkkOl............................................................;xOOOOOOOkkkkkkOOOO00
"""
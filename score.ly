\version "2.18.2"

% Copyright 2018 Moisés Cachay
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

\include "articulate.ly"
#(define (ac:twiddletime music)
  (let* ((tr (filter (lambda (x)
		     (and (eq? 'ArticulationEvent (ly:music-property x 'name))
		      (string= "trill" (ly:music-property x 'articulation-type))))
	      (ly:music-property music 'elements)))
	 (pre-t (if (pair? tr) (ly:music-property (car tr) 'twiddle)
		 '()))
	 (t (ac:targetTwiddleTime)))
   (if (ly:moment? pre-t)
    pre-t
    (let loop ((len (ly:music-length music)))
     (if (ly:moment<? t len)
      (loop (ly:moment-mul len (ly:make-moment 1/6)))
      len)))))

\header {
    title = "#title#"
    subtitle = "#id#"
    composer = "Usando il gioco compositivo 'Musikalisches Würfelspiel' (Gioco dei dadi) attribuito a W.A. Mozart"
    opus = "K516f"
    copyright = "Auguri da #gf# !"
    tagline = "Implementato in Python, con l'utilizzo di Lilypond, Timidity e ffmpeg"   
}

\paper {
    #(set-paper-size "a5" 'landscape)
}

% Use " | \mark "Trio" " before a measure to mark the trio part.

music = {
    \new GrandStaff <<
        \time 3/8

        \new Staff = "up" {
            \tempo "Allegro" 8 = 140
            \clef treble
            % 001
            f''8 d'' g''

            % 002
            a'8 fis'16 g' b' g''

            % 003
            g''8 c'' e''

            % 004
            g''8 d''4\trill

            % 005.1
            <g' b' d'' g''>4 r8

            % 005.2
            <g' b' d'' g''>4 r8

            % 006
            g'8 c'' e''

            % 007
            e''16 c'' e'' g'' c''' g''

            % 008
            c''4 r8

            % 009
            <c'' e''>8 <b' d''> r8

            % 010
            b'16 a' b' c'' d'' b'

            % 011
            e''16 c'' b' a' g' fis'

            % 012
            <c'' e'>8 <c'' e'>8 <c'' e'>8

            % 013
            c''8( g' e')

            % 014
            c''4 r8

            % 015
            e''8 g''16 e'' c''8

            % 016
            a''8( fis'' d'')

            % 017
            c''16 g' c'' e'' g' c''

            % 018
            g'8( c'' e'')

            % 019
            e''16 c'' e''8 g''

            % 020
            g''8 b''16 d''' d''8

            % 021
            c''16 e'' g'' d'' a' fis''

            % 022
            e''8 c'' g'

            % 023
            f''16 e'' d'' e'' f'' g''

            % 024.1
            <g' b' d'' g''>4 r8

            % 024.2
            <g' b' d'' g''>4 r8

            % 025
            d'16 fis' a' d'' fis'' a''

            % 026
            <c'' e''>8 <c'' e''> <c'' e''>

            % 027
            f''16 e'' f'' d'' c'' b'

            % 028
            fis''16 d'' a' a'' fis'' d''

            % 029
            b'16 d'' g'' d'' b'8

            % 030.1
            <g' b' d'' g''>4 r8

            % 030.2
            <g' b' d'' g''>4 r8

            % 031
            e''16 c'' g'8 e''

            % 032
            g'8 c'' e''

            % 033.1
            <g' b' d'' g''>4 r8

            % 033.2
            <g' b' d'' g''>4 r8

            % 034
            e''16 c'' d'' b' g'8

            % 035
            a'8 d'' fis''

            % 036
            a'16 e'' d'' g'' fis'' a''

            % 037
            g''16 b'' g'' d'' b'8

            % 038
            c''8 g' e''

            % 039
            g''8 g' g'

            % 040
            c''16 b' c'' e'' g' c''

            % 041
            c''16 b' c'' e'' g'8

            % 042
            b'16 c'' d'' b' a' g'

            % 043
            g''8 f''16 e'' d'' c''

            % 044
            a'8 f''16 d'' a' b'

            % 045
            c''16 b' c'' g' e' c'

            % 046
            g''8 b''16 g'' d'' b'

            % 047
            g''8 g''16 d'' b''8

            % 048
            e''8 c''16 e'' g'' c'''

            % 049
            e''8( c'' g')

            % 050
            c''8 e''16 c'' g'8

            % 051
            c''16 g' e'' c'' g'' e''

            % 052
            d''16( cis'') d'' f'' g' b'

            % 053
            <c'' e''>8 <c'' e''>16 <d'' f''> <e'' g''>8

            % 054
            <e' c''>8 <e' c''> <e' c''>

            % 055
            g''8 b'' d''

            % 056
            d''16 b' g'8 r8

            % 057
            e''8 c'' g'

            % 058
            g''8 e'' c''

            % 059
            g''8 c'' e''

            % 060
            g''8 f''16 e'' d'' c''

            % 061
            c''8 e''16 c'' g''8

            % 062
            e''16 c'' b' g' a' fis'

            % 063
            e''16 c'' b' c'' g'8

            % 064
            e''16 g'' c''' g'' e'' c''

            % 065
            d''16 a' d''8 fis''

            % 066
            fis''8 a'' fis''

            % 067
            c''16 b' c'' e'' g' c''

            % 068
            g''8 b''16 g'' d'' g''

            % 069
            g''8( e'' c'')

            % 070
            fis''8 a''16 fis'' d'' fis''

            % 071
            g''16 b'' d''' b'' g''8

            % 072
            f''16 e'' d'' c'' b' d''

            % 073
            g''8 e'' c''

            % 074
            c'''16 b'' c''' g'' e'' c''

            % 075
            <fis'' d''>8 <fis'' d''> <fis'' d''>

            % 076
            c'''16 b'' c''' g'' e'' c''

            % 077
            g''16 b'' g''8 d''

            % 078
            c''8 c' r8

            % 079
            c''4 r8

            % 080
            d''8 a'\turn fis''

            % 081.1
            <g' b' d'' g''>4 r8

            % 081.2
            <g' b' d'' g''>4 r8

            % 082
            d''16 b' g'8 g''

            % 083
            c''4 r8

            % 084
            c''16 g' e'' c'' g'' e''

            % 085
            c''8 e'' g'

            % 086
            d''8 d''16 g'' b''8

            % 087
            g''8 c'' e''

            % 088
            g''16 d'' g'' b'' g'' d''

            % 089
            f''16 e'' d''8 g''

            % 090
            fis''16 a'' d''' a'' fis'' a''

            % 091.1
            <g' b' d'' g''>4 r8

            % 091.2
            <g' b' d'' g''>4 r8

            % 092
            <b' d''>8 g''16 b'' d''8

            % 093
            c''4 r8

            % 094.1
            <g' b' d'' g''>4 r8

            % 094.2
            <g' b' d'' g''>4 r8

            % 095
            g''8 e'' c''

            % 096
            e''8 c'' g'

            % 097
            g''16 fis'' g'' d'' b' g'

            % 098
            c''8 g' e''

            % 099
            fis''8 a'' d''

            % 100.1
            <g' b' d'' g''>4 r8

            % 100.2
            <g' b' d'' g''>4 r8

            % 101
            e''16 d'' e'' g'' c''' g''

            % 102
            fis''16 d'' a'8 fis''

            % 103
            c''16 e'' c'' g' e'8

            % 104
            e''16 d'' e'' g'' c''' g''

            % 105
            fis''8 a''16 fis'' d'' fis''

            % 106
            a'8 d''16 c'' b' a'

            % 107.1
            <g' b' d'' g''>4 r8

            % 107.2
            <g' b' d'' g''>4 r8

            % 108
            e''8( g'' c''')

            % 109
            d''16 f'' d'' f'' b' d''

            % 110
            <b' d''>16( <a' c''>) <a' c''>( <g' b'>) <g' b'>( <fis' a'>)

            % 111
            c''4 r8

            % 112
            e''8 c'' g'

            % 113
            g''8 d'' b'

            % 114
            <b' d''>8 <b' d''> <b' d''>

            % 115
            c''16 g' e'' c'' g'' e''

            % 116
            d''16 f'' a'' f'' d'' b'

            % 117
            d''16 a' d'' fis'' a'' fis''

            % 118
            e''16 a'' g'' b'' fis'' a''

            % 119
            e''16 c'' g'' e'' c''' g''

            % 120
            d'''8 a''16 fis'' d'' a'

            % 121
            g''8 b''16 g'' d''8

            % 122
            g''16 fis'' g'' b'' d''8

            % 123.1
            <g' b' d'' g''>4 r8

            % 123.2
            <g' b' d'' g''>4 r8

            % 124
            <c'' e'>8 <c'' e'> <c'' e'>

            % 125
            g''16 e'' d'' b' g'8

            % 126
            c''16 g' c'' e'' g'' <c'' e''>

            % 127.1
            <g' b' d'' g''>4 r8

            % 127.2
            <g' b' d'' g''>4 r8

            % 128
            b'8 d'' g''

            % 129
            a''16 g'' fis'' g'' d''8

            % 130
            <e' c''>8 <e' c''> <e' c''>

            % 131
            c''4 r8

            % 132
            <c'' e''>8 <b' d''>16 <g' b'> g'8

            % 133
            d''8 g''16 d'' b' d''

            % 134
            a'16 e'' <b' d''> <a' c''> <g' b'> <fis' a'>

            % 135
            fis''8 fis''16 d'' a''8

            % 136
            c'''16 b'' c''' g'' e'' c''

            % 137
            c''8 g' e''

            % 138
            <a' d'' fis''>8 fis''4\trill

            % 139
            g''16 b'' g'' b'' d''8

            % 140
            a'8 a'16 d'' fis''8

            % 141
            d''16 e'' f'' d'' c'' b'

            % 142
            c''8 g' e''

            % 143
            g''8 d''16 b' g'8

            % 144
            g''8 c'' e''

            % 145
            d''16 f'' a' d'' b' d''

            % 146
            <fis' d''>8 <d'' fis''> <fis'' a''>

            % 147
            e''16 c''' b'' g'' a'' fis''

            % 148
            c'''16 b'' c''' g'' e'' c''

            % 149
            f''16 d'' a'8 b'

            % 150
            <g' c'' e''>8 e''4\trill

            % 151
            c''4 r8

            % 152
            g''8 f''16 e'' d'' c''

            % 153
            d''16 a' fis'' d'' a'' fis''

            % 154
            d''16 cis'' d'' fis'' a'' fis''

            % 155
            g''16 b'' g'' d'' b' g'

            % 156
            c''16 g' e'' c'' g''8

            % 157
            e''16 d'' e'' g'' c''' g''

            % 158
            b'8 d''16 b' a' g'

            % 159
            e''16 g'' d'' c'' b' a'

            % 160
            c''16 b' c'' e'' g' c''

            % 161
            <fis' d''>8 <fis' d''> <fis' d''>

            % 162
            e''16 d'' e'' g'' c''' g''

            % 163
            g''16 fis'' g'' d'' b' g'

            % 164
            d''8 g'4

            % 165
            d''8( b' g')

            % 166
            d''16 b'' g'' d'' b'8

            % 167
            c''8 c''16 d'' e''8

            % 168
            g''8 f''16 e'' d'' c''

            % 169
            e''16 g'' d'' g'' a' fis''

            % 170
            c''4 r8

            % 171
            b'16 c'' d'' e'' f'' d''

            % 172
            c''4 r8

            % 173
            f''16 a'' a'8 b'16 d''

            % 174
            g'8 c'' e''

            % 175
            e''16 c'' b' d'' g''8

            % 176
            a''16 g'' b'' g'' d'' g''
        }

        \new Staff = "down" {
            \clef bass
            % 001
            f8 d g

            % 002
            <b, g>4 r8

            % 003
            <c e>4 r8

            % 004
            g,16 b, g8 b,

            % 005.1
            g,8 g16 f e d

            % 005.2
            g,8 b16 g fis e

            % 006
            <c e>4 r8

            % 007
            <c g>4 r8

            % 008
            c8 g, c,

            % 009
            g4 g,8

            % 010
            g4 r8

            % 011
            c8 d d,

            % 012
            c8 c c

            % 013
            <e g>4 r8

            % 014
            c8 g, c,

            % 015
            <c g>4 <c e>8

            % 016
            <d fis>4 <c fis>8

            % 017
            <e g>4 r8

            % 018
            <c e>4 <c g>8

            % 019
            <c g>4 <c e>8

            % 020
            b,4 r8

            % 021
            c8 d d,

            % 022
            c4 r8

            % 023
            f16 e d e f g

            % 024.1
            g,8 g16 f e d

            % 024.2
            g,8 b16 g fis e

            % 025
            d4 c8

            % 026
            c16 e g e c' c

            % 027
            <g b>4 r8

            % 028
            <c a>4 r8

            % 029
            g4 g,8

            % 030.1
            g,8 g16 f e d

            % 030.2
            g,8 b16 g fis e

            % 031
            <c g>4 <c g>8

            % 032
            <c e>4 r8

            % 033.1
            g,8 g16 f e d

            % 033.2
            g,8 b16 g fis e

            % 034
            g4 r8

            % 035
            <fis d>4 <a c>8

            % 036
            c8 d d,

            % 037
            <b, d>4 r8

            % 038
            <c e>16 g <c e> g <c e> g

            % 039
            b,16 d g d b, g,

            % 040
            <e c>4 r8

            % 041
            <c e>4 r8

            % 042
            g,4 r8

            % 043
            <c e>4 r8

            % 044
            f4 g8

            % 045
            <e g>4 r8

            % 046
            <b, d>4 r8

            % 047
            <b, d>4 r8

            % 048
            <c g>4 <c e>8

            % 049
            <c e>16 g <c e> g <c e> g

            % 050
            <e g>4 r8

            % 051
            <c e>4 r8

            % 052
            f4 g8

            % 053
            c4 r8

            % 054
            c8 c c

            % 055
            <b, d>4 r8

            % 056
            <g, g>4 g8

            % 057
            <c e>16 g <c e> g <c e> g

            % 058
            <c e>16 g <c e> g <c e> g

            % 059
            <c e>16 g <c e> g <c e> g

            % 060
            <c e>4 r8

            % 061
            <e g>4 r8

            % 062
            c8 d d,

            % 063
            c4 r8

            % 064
            <c g>4 <c g>8

            % 065
            << { fis4 } \\ { d4 } >> r8

            % 066
            << { a8 fis d } \\ { d8 d c } >>

            % 067
            << { e4 } \\ { c4 } >> <g e>8

            % 068
            b,4 r8

            % 069
            <c e>4 r8

            % 070
            d4 c8

            % 071
            <b, d>4 <b, d>8

            % 072
            f4 g8

            % 073
            <c e>16 g <c e>16 g <c e>16 g

            % 074
            << { e4 } \\ { c4 } >> r8

            % 075
            c8 c c

            % 076
            <c e>4 <c g>8

            % 077
            <b, d>4 <b, g>8

            % 078
            c4 c,8

            % 079
            c8 g, c,

            % 080
            c4 r8

            % 081.1
            g,8 g16 f e d

            % 081.2
            g,8 b16 g fis e

            % 082
            << { g4 } \\ { b,4 } >> <b, d>8

            % 083
            c8 g, c,

            % 084
            <c e>4 r8

            % 085
            <e g>4 r8

            % 086
            <b, g>4 r8

            % 087
            <c e>4 <c g>8

            % 088
            <b, d>4 <b, d>8

            % 089
            f16 e d8 g

            % 090
            <c a>4 <c a>8

            % 091.1
            g,8 g16 f e d

            % 091.2
            g,8 b16 g fis e

            % 092
            <g, g>4 g8

            % 093
            c8 g, c,

            % 094.1
            g,8 g16 f e d

            % 094.2
            g,8 b16 g fis e

            % 095
            << { e4 } \\ { c4 } >> r8

            % 096
            c4 r8

            % 097
            <b, d>4  <b, g>8

            % 098
            <c e>16 g <c e> g <c e> g

            % 099
            <c a>4 <c a>8

            % 100.1
            g,8 g16 f e d

            % 100.2
            g,8 b16 g fis e

            % 101
            << { g4 e8 } \\ { c4 c8 } >>

            % 102
            <a c>4 <a c>8

            % 103
            <e g>4 r8

            % 104
            c4 r8

            % 105
            c4 r8

            % 106
            c8 d d,

            % 107.1
            g,8 g16 f e d

            % 107.2
            g,8 b16 g fis e

            % 108
            <c g>4 <c e>8

            % 109
            <f a>4 <g d'>8

            % 110
            c8 d d,

            % 111
            c8 g, c,

            % 112
            <c e>16 g <c e> g <c e> g

            % 113
            <g b>4 r8

            % 114
            g8 g g

            % 115
            <c e>4 r8

            % 116
            f4 g8

            % 117
            <d fis>4 r8

            % 118
            c8 d d,

            % 119
            <c e>4 r8

            % 120
            <d fis>4 <c fis>8

            % 121
            <b, g>4 r8

            % 122
            <b, d>8 <b, d> <b, g>

            % 123.1
            g,8 g16 f e d

            % 123.2
            g,8 b16 g fis e

            % 124
            c8 c c

            % 125
            g8 g, r8

            % 126
            e4 e16 c

            % 127.1
            g,8 g16 f e d

            % 127.2
            g,8 b16 g fis e

            % 128
            g4 r8

            % 129
            <b, d>8 <b, d> <b, g>

            % 130
            c8 c c

            % 131
            c8 g, c,

            % 132
            g8 g, r8

            % 133
            <b, g>4 r8

            % 134
            c8 d d,

            % 135
            << { d8 d d } \\ { c8 c c } >>

            % 136
            << { e4 } \\ { c4 } >> r8

            % 137
            <c e>16 g <c e> g <c e> g

            % 138
            d,16 d cis d c d

            % 139
            b,4 r8

            % 140
            <c fis>8 <c fis> <c a>

            % 141
            <b, g>4 g,8

            % 142
            <c e>4 r8

            % 143
            <b, d>4 <b, d>8

            % 144
            <c e>16 g <c e> g <c e> g

            % 145
            f4 g8

            % 146
            c8 c c

            % 147
            c8 d d,

            % 148
            <c e>4 r8

            % 149
            f4 g8

            % 150
            c16 b, c d e fis

            % 151
            c8 g, c,

            % 152
            <c e>4 r8

            % 153
            c4 r8

            % 154
            c4 r8

            % 155
            <b, d>4 r8

            % 156
            <e g>4 r8

            % 157
            c4 r8

            % 158
            g,4 r8

            % 159
            c8 d d,

            % 160
            <c e>4 <c e>8

            % 161
            c8 c c

            % 162
            <c g>4 <c e>8

            % 163
            <b, d>4 r8

            % 164
            g16 fis g d b, g,

            % 165
            b,4 r8

            % 166
            <g b>4 r8

            % 167
            <c e>4 r8

            % 168
            <c e>4 <e g>8

            % 169
            c8 d d,

            % 170
            c8 g, c,

            % 171
            <g, g>4 <b, g>8

            % 172
            c8 g, c,

            % 173
            f4 g8

            % 174
            <c e>16 g <c e> g <c e> g

            % 175
            g8 g, r8

            % 176
            <b, d>4 <b, d>8
        }
    >>
}

\score {
    \music
    \layout {
        indent = 0\cm
    }
}

\score {
    \unfoldRepeats \articulate \music
    \midi {}
}

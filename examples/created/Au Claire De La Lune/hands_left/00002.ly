\paper {
  indent = 0\mm
  line-width = 110\mm
  oddHeaderMarkup = ""
  evenHeaderMarkup = ""
  oddFooterMarkup = ""
  evenFooterMarkup = ""
}


\new GrandStaff <<
\new Staff { \key c \major \clef treble \time 4/4 d'4 r2 r4 }
\new Staff { \key c \major \clef "bass" \time 4/4 r4  
#(define color-mapping-1
(list
(cons (ly:make-pitch -1 0 ) (x11-color 'OrangeRed))
))

#(define (pitch-equals? p1 p2) 
(and 
(= (ly:pitch-alteration p1) (ly:pitch-alteration p2)) 
(= (ly:pitch-octave p1) (ly:pitch-octave p2)) 
(= (ly:pitch-notename p1) (ly:pitch-notename p2)) 
))
#(define (pitch-to-color-1 pitch) 
(let ((color (assoc pitch color-mapping-1 pitch-equals?))) 
(if color 
(cdr color)))) 
#(define (color-notehead-1 grob) 
(pitch-to-color-1 
(ly:event-property (ly:grob-property grob 'cause) 'pitch))) 

\once \override NoteHead #'color = #color-notehead-1 
 c4 b4 a4 }
>>

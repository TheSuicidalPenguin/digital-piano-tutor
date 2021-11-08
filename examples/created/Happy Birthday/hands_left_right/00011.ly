\paper {
  indent = 0\mm
  line-width = 110\mm
  oddHeaderMarkup = ""
  evenHeaderMarkup = ""
  oddFooterMarkup = ""
  evenFooterMarkup = ""
}


\new GrandStaff <<
\new Staff { \key f \major \clef treble \time 3/4  
#(define color-mapping-0
(list
(cons (ly:make-pitch 0 3 ) (x11-color 'OrangeRed))
))

#(define (pitch-equals? p1 p2) 
(and 
(= (ly:pitch-alteration p1) (ly:pitch-alteration p2)) 
(= (ly:pitch-octave p1) (ly:pitch-octave p2)) 
(= (ly:pitch-notename p1) (ly:pitch-notename p2)) 
))
#(define (pitch-to-color-0 pitch) 
(let ((color (assoc pitch color-mapping-0 pitch-equals?))) 
(if color 
(cdr color)))) 
#(define (color-notehead-0 grob) 
(pitch-to-color-0 
(ly:event-property (ly:grob-property grob 'cause) 'pitch))) 

\once \override NoteHead #'color = #color-notehead-0 
 f'2 c'8. c'16 }
\new Staff { \key f \major \clef bass \time 3/4 r2 r4 }
>>

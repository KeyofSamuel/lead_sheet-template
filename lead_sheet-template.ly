\version "2.19.82"

%%%% Header Section %%%%

%% Title Header %%
\header {
  title			= ""
  subtitle		= ""
  composer		= ""
  instrument		= "'C' Instrument"
  meter			= ""

  tagline		= \markup {
    Lead Sheet Template - Rev.
    \simple #(strftime "%m/%d/%Y" (localtime (current-time)))
  }
}

%% Print Page Numbers on All Pages %%
\paper {
  oddHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #not-first-page
    \fromproperty #'header:title
    " "
    \on-the-fly #print-page-number-check-first
    \fromproperty #'page:page-number-string
  }

  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first
    \fromproperty #'page:page-number-string
    " "
    \fromproperty #'header:title
  }
}

%% Overrides for Stem Transparency %%
stemOff = { \override Staff.Stem #'transparent = ##t }
stemOn = { \override Staff.Stem #'transparent = ##f }

%% Copy/paste/edit this line to add various markings %%
% s1*0^\markup { \musicglyph #"scripts.segno" \box "Chorus" }

%%%% Variable Section %%%%

  %% Intro %%

    intro = \relative bes' {
      \improvisationOn \stemOff
      bes4 bes bes bes	| bes bes bes bes	| bes bes bes bes	| bes bes bes bes
      \improvisationOff \stemOn
    }
    
    introChanges = { \chordmode {
    
    } }
    
    %% Verse One %%
    
    verseOne = \relative bes' { 
    
    }

    verseOneLyric = \lyricmode {
    
    }
    
    verseOneChanges = { \chordmode {
    
    } }
    
    %% Chorus One %%

    chorusOne = \relative bes' { 

    }

    chorusOneLyric = \lyricmode {
    
    }
    
    chorusOneChanges = { \chordmode {
    
    } }
    
    %%%% Score Section %%%%

\score {
<<

  \new ChordNames
  <<
    { \set chordChanges = ##t
      \introChanges
      \verseOneChanges
      \chorusOneChanges
    } 
  >>

  \new Voice = "song" \with { \consists "Pitch_squash_engraver" }
  <<
    %\tempo 4 = 120
    \key c \major
    \time 4/4
    {
      \intro
      \new Voice = "lead" {
        \verseOne
        \chorusOne
      }
    }
  >>

  \new Lyrics \lyricsto "lead"
  <<
    {
      \verseOneLyric
      \chorusOneLyric
    }
  >>

>>

  \layout {
  }

}

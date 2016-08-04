%%%%%%%%%%%%
%% This is upnmthesis.cls, created by Lian Tze LIM (liantze@gmail.com)
%% for the Centre of Graduate Studies, Universiti Pertahanan Nasional
%% Malaysia.
%% http://liantze.penguinattack.org/latextypesetting.html#upnmthesis
%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umsthesis}[2016/08/04 LaTeX2e class for Universiti Malaysia Sabah (UMS) v1.0.  Copyright (c) 2016 Lian Tze LIM (liantze@gmail.com)]

\LoadClass[11pt,oneside]{memoir}

%%%%%%%%%%%%%
% Languages. english is the default.
%%%%%%%%%%%%%
\newif\if@bahasam
\newif\if@english
\DeclareOption{english}{\@englishtrue\@bahasamfalse}
\DeclareOption{bahasam}{\@englishfalse\@bahasamtrue}

%%%%%%%%%%%%%
% Better typography
%%%%%%%%%%%%%
\newif\if@microtype
\DeclareOption{microtype}{\@microtypetrue}

%%%%%%%%%%%%%
% Use sans for maths?
%%%%%%%%%%%%%
\newif\if@usesansmath
\DeclareOption{usesansmath}{\@usesansmathtrue}

%%%%%%%%%%%%%
% Hyphenation.
%%%%%%%%%%%%%
\newif\if@disableHyphenate
\DeclareOption{nohyphen}{\@disableHyphenatetrue}
\ExecuteOptions{english}
\ProcessOptions

\RequirePackage{etoolbox}

%%%%%%%%%%
% Filter some annoying warning messages
%%%%%%%%%%
\RequirePackage{silence}
\WarningFilter{babel}{No hyphenation patterns were preloaded}
\WarningFilter{latexfont}{Font shape `}
\WarningFilter{latexfont}{Some font shapes}
\WarningFilter{latexfont}{Size substitution}
\WarningFilter{hyperref}{Rerun to get /PageLabels entry}

\if@microtype\RequirePackage{microtype}\fi

\if@bahasam
  \RequirePackage[english,main=bahasam]{babel}
\fi
\if@english
  \RequirePackage[bahasam,main=english]{babel}
\fi

%% Current Bahasa hyphenation is problematic and
%% prone to errors, therefore we disable it in Bahasa
%% mode.
\if@disableHyphenate
  \tolerance=1
  \emergencystretch=\maxdimen
  \hyphenpenalty=10000
  \hbadness=10000
\fi

%%%%%%%%%%%%%%%%%%%
% New floats
%%%%%%%%%%%%%%%%%%%
\newsubfloat{table}
\newsubfloat{figure}
\newcommand{\photoname}{Photo}
\newcommand{\listphotoname}{\texorpdfstring{LIST OF PHOTOGRAPHS}{List of Photographs}}
\newfloat[chapter]{photo}{lop}{\photoname}
\newlistof{listofphotos}{lop}{\listphotoname}
\addtodef{\insertchapterspace}{}%
 {\addtocontents{lop}{\protect\addvspace{10pt}}}
\newlistentry{photo}{lop}{0}

%%%%%%%%%
% Various translations for keywords
%%%%%%%%%
\newcommand{\titlename}{Title}
\newcommand{\sourcename}{Source}
\newcommand{\acknowname}{Acknowledgement}
\newcommand{\appendixlistname}{\texorpdfstring{LIST OF APPENDICES}{List of Appendices}}
\newcommand{\namename}{Name}
\newcommand{\matricname}{Matric No.}
\newcommand{\degreename}{Degree}
\newcommand{\vivadatename}{Viva Date}
\newcommand{\certifiedby}{Certified by}
\newcommand{\signaturename}{Signature}
\addto\captionsenglish{
  \renewcommand*\contentsname{\texorpdfstring{TABLE OF CONTENTS}{Table of Contents}}
  \renewcommand*\listfigurename{\texorpdfstring{LIST OF FIGURES}{List of Figures}}
  \renewcommand*\listtablename{\texorpdfstring{LIST OF TABLES}{List of Tables}}
  \renewcommand*\appendixname{Appendix}
  \renewcommand*\appendixpagename{Appendices}
  \renewcommand*\appendixtocname{Appendices}
}

\addto\captionsbahasam{
  \renewcommand{\pagename}{Halaman}
  \renewcommand*{\chaptername}{Bab}
  \renewcommand*\figurename{Rajah}
  \renewcommand*\contentsname{\texorpdfstring{KANDUNGAN}{Kandungan}}
  \renewcommand*\listfigurename{\texorpdfstring{SENARAI RAJAH}{Senarai Rajah}}
  \renewcommand*\listtablename{\texorpdfstring{SENARAI JADUAL}{Senarai Jadual}}
  \renewcommand*\appendixname{Lampiran}
  \renewcommand*\appendixpagename{Lampiran}
  \renewcommand*\appendixtocname{Lampiran}
  \renewcommand*\appendixlistname{\texorpdfstring{SENARAI LAMPIRAN}{Senarai Lampiran}}
  \renewcommand*{\sourcename}{Sumber}
  \renewcommand*{\titlename}{Tajuk}
  \renewcommand*{\acknowname}{Penghargaan}
  \renewcommand*{\photoname}{Foto}
  \renewcommand*\listphotoname{\texorpdfstring{SENARAI FOTO}{Senarai Foto}}
  \renewcommand*{\namename}{Nama}
  \renewcommand*{\matricname}{No.~Matrik}
  \renewcommand*{\degreename}{Ijazah}
  \renewcommand*{\vivadatename}{Tarikh Viva}
  \renewcommand*{\certifiedby}{Disahkan oleh}
  \renewcommand*{\signaturename}{Tandatangan}
}

\pretocmd{\bibliography}{%
  \if@english
    \renewcommand*\bibname{\texorpdfstring{BIBLIOGRAPHY}{Bibliography}}
    \renewcommand*\refname{\texorpdfstring{BIBLIOGRAPHY}{Bibliography}}
  \fi
  \if@bahasam
    \renewcommand*\bibname{\texorpdfstring{RUJUKAN}{Rujukan}}
  \fi
}{}{}

\RequirePackage{tabularx,makecell}
\RequirePackage{dashrule}
\AtBeginDocument{%
  \RequirePackage[breaklinks,bookmarksdepth=2]{hyperref}
  \pdfstringdefDisableCommands{%
    \let\MakeUppercase\relax
  }
}


%%%%%%%%%%%
% Information about the thesis
%%%%%%%%%%%
\def\@author{\textbf{!INSERT AUTHOR!}}
\def\@title{\textbf{!INSERT TITLE!}}
\def\@mtmatric{\textnf{!INSERT MATRIC NUMBER!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
% \def\@mtsubmissionmonth{\textbf{!INSERT MONTH!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}
\def\@mtstudyfield{\textbf{!INSERT studyfield!}}
\def\@mtfaculty{\textbf{!INSERT FACULTY!}}
\def\@mtvivadate{\textbf{!INSERT VIVA DATE!}}

\newcommand{\matric}[1]{\def\@mtmatric{#1}}
\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
% \newcommand{\submissionmonth}[1]{\def\@mtsubmissionmonth{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}
\newcommand{\studyfield}[1]{\def\@mtstudyfield{#1}}
\newcommand{\faculty}[1]{\def\@mtfaculty{#1}}
\newcommand{\vivadate}[1]{\def\@mtvivadate{#1}}


%%%%%%%%%%
% Fonts
%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{mathspec}
\setmainfont[Mapping=tex-text,AutoFakeSlant=0.3,BoldFont = *_Bold,BoldItalicFont = *_Bold,BoldItalicFeatures=FakeSlant,Extension=.ttf]{Tahoma}
\setsansfont[Mapping=tex-text,AutoFakeSlant=0.3,BoldFont = *_Bold,BoldItalicFont = *_Bold,BoldItalicFeatures=FakeSlant,Extension=.ttf]{Tahoma}
% \setmathfont{Cambria Math}
\if@usesansmath
  \setmathfont(Digits,Latin)[AutoFakeSlant=0.3,BoldFont = *_Bold,BoldItalicFont = *_Bold,BoldItalicFeatures=FakeSlant,Extension=.ttf]{Tahoma}
\fi

%%%%%%%%%%
% Page geometry and text
%%%%%%%%%%

%%%%%%%%%%
% Page layout -- do not change!
%%%%%%%%%%
\setstocksize{297mm}{210mm}
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{38mm}{28mm}{*}
\setulmarginsandblock{28mm}{38mm}{*}
\setheadfoot{\baselineskip}{\dimexpr10mm-1.25ex}
\checkandfixthelayout
\makeoddhead{plain}{}{}{}
\makeoddfoot{plain}{}{\thepage}{}
\makeoddhead{headings}{}{}{}
\makeoddfoot{headings}{}{\thepage}{}

%%%%%%%%%%%%
% Line and paragraph spacing
%%%%%%%%%%%%
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{1.5}
\setlength{\parindent}{12.5mm}
%\abnormalparskip{\onelineskip}
\AtBeginEnvironment{quote}{\SingleSpacing}
\AtBeginEnvironment{quotation}{\SingleSpacing}
\patchcmd{\quote}{\rightmargin}{\leftmargin 12.5mm \rightmargin}{}{}
\patchcmd{\quotation}{\rightmargin}{\leftmargin 12.5mm \rightmargin}{}{}
\raggedbottom

%%%%%%%%%%%%
% Bulleted and itemized lists
%%%%%%%%%%%%
\firmlist

%%%%%%%%%%%%%%%%%%%%%%%
% Cover and title pages
%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecoverandtitlepage}{%
  \renewcommand{\thepage}{C\arabic{page}}%
  \makecoverpage%
  \renewcommand{\thepage}{\arabic{page}}%
  \pagenumbering{roman}%
  \maketitlepage%
}

\newcommand{\makecoverpage}{%
  \changepage{-54mm}{-10mm}{10mm}{}{}{32mm}{}{}{}%
  \begin{titlingpage*}%
  \SingleSpacing\thispagestyle{empty}%
  \fontsize{18pt}{20pt}\bfseries\selectfont\centering%
  \MakeUppercase{\@title}\par%
  \vfill%
  \MakeUppercase{\@author}\par%
  \vfill%
  \MakeUppercase{\@mtfaculty}\par%
  UNIVERSITI SABAH MALAYSIA\par
  \@mtsubmissionyear\par%
  \end{titlingpage*}%
  \changepage{54mm}{10mm}{-10mm}{}{}{-32mm}{}{}{}%
}

\newcommand{\maketitlepage}{%
  \changepage{-54mm}{}{}{}{}{32mm}{}{}{}%
  \begin{titlingpage*}%
  \addcontentsline{toc}{chapter}{\MakeUppercase{\titlename}}
  \SingleSpacing\thispagestyle{empty}%
  \fontsize{18pt}{20pt}\bfseries\selectfont\centering%
  \MakeUppercase{\@title}\par%
  \vfill%
  \MakeUppercase{\@author}\par%
  \vfill%
  THESIS SUBMITTED IN PARTIAL FULFILLMENT FOR THE DEGREE OF\\%
  \MakeUppercase{\@mtdegree}\par%
  \vfill%
  \MakeUppercase{\@mtfaculty}\par%
  UNIVERSITI SABAH MALAYSIA\par
  \@mtsubmissionyear\par%
  \end{titlingpage*}%
  \changepage{54mm}{}{}{}{}{-32mm}{}{}{}%
}

%%%%%%%%%%%%
% Candidate's Declaration
%%%%%%%%%%%%
\newcommand{\makedeclaration}[1]{%
  \begingroup
  \SingleSpacing
  \newlength\anamelength
  \settowidth{\anamelength}{\@author}
  \addtolength{\anamelength}{2em}
  \if@english
  \chapter{Declaration}
  \noindent I hereby declare that the material in this thesis is my own except for quotations, excerpts, summaries and references, which have been duly acknowledged.

  \vspace{3cm}

  \noindent%
  \begin{tabularx}{\textwidth}{@{}X c}
  #1 & \hdashrule{\anamelength}{1pt}{1pt}\\
     & \@author\\
     & \@mtmatric\\
  \end{tabularx}
  \fi
  \if@bahasam
  \chapter{Pengakuan}
  \noindent Karya ini adalah hasil kerja saya sendiri kecuali nukilan, ringkasan dan rujukan yang tiap-tiap satunya telah saya jelaskan sumbernya.

  \vspace{3\baselineskip}

  \noindent%
  \begin{tabularx}{\textwidth}{@{}X c}
  #1 & \hdashrule{\anamelength}{1pt}{1pt}\\
     & \@author\\
     & \@mtmatric\\
  \end{tabularx}
  \fi
  \endgroup
}

%%%%%%%%%%%%
% Supervisor's Declaration
%%%%%%%%%%%%
\newenvironment{SVdeclaration}{
  \clearpage\begingroup
  \centering\SingleSpacing
  \renewcommand{\arraystretch}{2.0}%
  \begin{tabularx}{.95\textwidth}{l @{\hspace{1em}:\hspace{0.5em}} >{\bfseries\raggedright\arraybackslash}X}
  \MakeUppercase{\namename}   & \MakeUppercase{\@author}\\
  \MakeUppercase{\matricname} & \MakeUppercase{\@mtmatric}\\
  \MakeUppercase{\titlename}  & \MakeUppercase{\@title}\\
  \MakeUppercase{\degreename} & \makecell[lt]{\MakeUppercase{\@mtdegree}\\(\MakeUppercase{\@mtstudyfield})}\\
  \MakeUppercase{\vivadatename} & \MakeUppercase{\@mtvivadate}\\
  \end{tabularx}\par

  \vspace{2\baselineskip}
  \textbf{\MakeUppercase{\certifiedby}}\par
  \vspace{\baselineskip}
  \newcounter{member}
  \newcommand{\member}[2]{%
    \\[2em]
    \stepcounter{member}
    \themember. & \textbf{\MakeUppercase{##1}} \\
    & \emph{##2} & \\
    \cmidrule{3-3}
  }
  \renewcommand{\arraystretch}{1.0}
  \tabularx{\textwidth}{>{\bfseries}l >{\raggedright\arraybackslash}X c}
  && \signaturename\\
}{%
  \endtabularx
  \endgroup
  \clearpage
}


%%%%%%%%%%%%
% Acknowledgements
%%%%%%%%%%%%
\newenvironment{acknowledgement}[1][]{%
  \chapter{\acknowname}%
  \def\@acknowdate{#1}%
  \begingroup\SingleSpacing
}{%
  \par\bigskip%
  \noindent\@author\\%
  \noindent\@acknowdate\par%
  \endgroup%
}

%%%%%%%%%%%%
% Abstracts
%%%%%%%%%%%%
\newcommand{\inputEnAbstract}[2][]{%
  \begingroup\SingleSpacing%
  \if@english
    \chapter{Abstract}
  \else
    \chapter{\emph{Abstract}}
    \begin{center}
    \bfseries\itshape #1
    \end{center}
  \fi%
  \if@bahasam\itshape%
    \begin{foreignlanguage}{english}%
    \SingleSpacing\noindent\input{#2}\par
    \end{foreignlanguage}
  \else
    \SingleSpacing\noindent\input{#2}\par
  \fi
  \endgroup
}

\newcommand{\inputMsAbstract}[2][]{%
  \begingroup\SingleSpacing%
  \if@bahasam
    \chapter{Abstrak}%
  \else
    \chapter{\emph{Abstrak}}
    \begin{center}
    \bfseries\itshape #1
    \end{center}
  \fi%
  \if@english\itshape%
    \begin{foreignlanguage}{bahasam}%
    \SingleSpacing\noindent\input{#2}\par
    \end{foreignlanguage}
  \else
    \SingleSpacing\noindent\input{#2}\par
  \fi
  \endgroup
}

\newlength\tmplength



%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\bgroup\SingleSpacing\vskip\beforechapskip}
\appto{\afterchaptertitle}{\vspace{\onelineskip}\egroup\normalsize}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{2\baselineskip}
\setlength\afterchapskip{3\baselineskip}
\renewcommand*\chapnamefont{\Large\bfseries}
\renewcommand*\chapnumfont{\Large\bfseries\centering}
\renewcommand*\chaptitlefont{\SingleSpacing\Large\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}

%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{subsubsection}
\renewcommand{\thesubsubsection}{\alph{subsection}.}
\setsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesecskip{-\baselineskip}
\setaftersecskip{0.1ex plus .2ex}
\setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsecskip{-\baselineskip}
\setaftersubsecskip{0.1ex plus .2ex}
\setsubsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsubsecskip{-\baselineskip}
\setaftersubsubsecskip{0.1ex plus .2ex}


%%%%%%%%%%%%
% Captions
%%%%%%%%%%%%
\captionnamefont{\bfseries}
\captiontitlefont{\bfseries}
\AtBeginEnvironment{figure}{%
  \captionstyle{\raggedright}
  \newcommand\source[1]{%
    \settowidth{\tmplength}{\bfseries\figurename \thefigure:}
    {\raggedright\mdseries\makebox[\tmplength][l]{\sourcename}: #1\par\bigskip}
  }
}
\AtBeginEnvironment{photo}{%
  \captionstyle{\raggedright}
  \newcommand\source[1]{%
    \settowidth{\tmplength}{\bfseries\photoname \thephoto:}
    {\raggedright\mdseries\makebox[\tmplength][l]{\sourcename}: #1\par\bigskip}
  }
}
\AtBeginEnvironment{table}{%
  \newcommand\source[1]{%
    \bigskip
    {\raggedright\mdseries\sourcename: #1\par\bigskip}
  }
}


%%%%%%%%%%
% Appendices
%%%%%%%%%%
\renewcommand*\appendixname{Appendix}
\newlistof{listofappendices}{apx}{\appendixlistname}
\addtodef\appendix{}{%
  \renewcommand\chaptername{\appendixname}%
    \renewcommand\mychap[1]{\orichapter{##1}}
    \let\@chapter\app@chapter
    \settocdepth{chapter}
    \cftinserthook{apx}{AppendixToCLines}
}
\def\app@chapter[#1]#2{%
  \m@mpn@new@chaptrue%
  \m@mpn@new@schapfalse%
  \def\f@rbdy{#2}%
  \ifx\ch@pt@c\@empty % no optional args
    \def\f@rtoc{#2}%
    \def\f@rhdr{#2}%
  \else                  % at least one opt arg
    \let\f@rtoc\ch@pt@c
    \ifx\@empty#1\@empty
      \let\f@rhdr\ch@pt@c
    \else
      \def\f@rhdr{#1}%
    \fi
  \fi
  \m@m@Andfalse
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \m@m@Andtrue
    \fi
  \fi
  \ifm@m@And
    \refstepcounter{chapter}%
  \fi
  \ifartopt
    \@makechapterhead{#2}%
    \@afterheading
    \chaptermark{\f@rhdr}%
  \else
    \chaptermark{\f@rhdr}
    \insertchapterspace
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
    \fi
    \@afterheading
  \fi
  \ifm@m@And
    \ifanappendix
      \addcontentsline{apx}{appendix}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memappchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \addcontentsline{apx}{chapter}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \else
    \addcontentsline{apx}{chapter}{\f@rtoc}%
    \ifanappendix
      \memappchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \memchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \fi
  \ifheadnameref\M@gettitle{\f@rhdr}\else\M@gettitle{\f@rtoc}\fi%
}

\cftinsertcode{AppendixToCLines}{%
  \settowidth{\tmplength}{\appendixname\space}
  \renewcommand*{\cftchapterpresnum}{\appendixname\space}
  \renewcommand*\cftchapteraftersnum{:\space}%
  \renewcommand*\cftchapteraftersnumb{}%
  \setlength\cftchapternumwidth{\dimexpr\tmplength+1.5em}%
  \renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
  \renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

\apptocmd{\mainmatter}{%
  \appto{\afterchaptertitle}{\thispagestyle{empty}}%
}{}{}

\patchcommand{\bibitem}{\SingleSpacing}{}


%%%%%%%%%%%%
% Content Lists
%%%%%%%%%%%%
\let\orichapter\chapter
\newcommand\mychap[2][]{\orichapter%
[\ifstrempty{#1}{\texorpdfstring{\MakeUppercase{#2}}{#2}}%
{\texorpdfstring{\MakeUppercase{#1}}{#1}}]%
{#2}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}

\settocdepth{subsection}
\setcounter{lofdepth}{2}
\setcounter{lotdepth}{2}
\renewcommand*\cftdotsep{\cftnodots}
\renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}
\setpnumwidth{2em}
\setrmarg{4em}
\AtBeginDocument{%
  \settowidth{\tmplength}{\bfseries\MakeUppercase{\chaptername} 9:\space}
  \setlength{\cftchapternumwidth}{\tmplength}
}
\renewcommand*{\cftchapterpresnum}{\MakeUppercase{\chaptername\space}}
\renewcommand*{\cftchapteraftersnum}{:\space}
\cftsetindents{section}{0pt}{2.5em}
\cftsetindents{subsection}{2.5em}{3em}

\setlength{\cftbeforefigureskip}{\onelineskip}
\renewcommand*{\cftfigurepresnum}{\figurename\space}
\AtBeginDocument{%
  \settowidth{\tmplength}{\normalsize\figurename 9.99:\space}
  \setlength{\cftfigurenumwidth}{\tmplength}
  \cftsetindents{subfigure}{\tmplength}{2em}
}
\renewcommand*{\cftfigureaftersnum}{:\space}

\setlength{\cftbeforetableskip}{\onelineskip}
\renewcommand*{\cfttablepresnum}{\tablename\space}
\AtBeginDocument{%
  \settowidth{\tmplength}{\normalsize\tablename 9.99:\space}
  \setlength{\cfttablenumwidth}{\tmplength}
  \cftsetindents{subtable}{\tmplength}{2em}
}
\renewcommand*{\cfttableaftersnum}{:\space}

\setlength{\cftbeforephotoskip}{\onelineskip}
\renewcommand*{\cftphotopresnum}{\photoname\space}
\AtBeginDocument{%
  \settowidth{\tmplength}{\normalsize\photoname 9.99:\space}
  \setlength{\cftphotonumwidth}{\tmplength}
}
\renewcommand*{\cftphotoaftersnum}{:\space}

\renewcommand{\aftertoctitle}{\afterchaptertitle\hfill\pagename\par}
\renewcommand{\afterlottitle}{\afterchaptertitle\hfill\pagename\par\vspace*{-\onelineskip}}
\renewcommand{\afterloftitle}{\afterchaptertitle\hfill\pagename\par\vspace*{-\onelineskip}}
\renewcommand{\afterloptitle}{\afterchaptertitle\hfill\pagename\par\vspace*{-\onelineskip}}
\renewcommand{\afterapxtitle}{\afterchaptertitle\hfill\pagename\par}

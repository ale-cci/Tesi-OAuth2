%!TEX program = xelatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[30/03/2020 v0.1 Custom class]

\def\@@ptsize{11pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[a4paper,\@@ptsize]{article}
\RequirePackage{xcolor}
\RequirePackage[margin=1in, top=.8in]{geometry}
\RequirePackage{amsmath}
\RequirePackage{subfiles}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage{listings}
%\RequirePackage{lstautogobble}  % Fix relative indenting
\setmainfont{Roboto}

% Not required
\RequirePackage{tcolorbox}
\RequirePackage{enumitem}


% Main colors
\definecolor{clr-primary}{HTML}{0054A3}
\definecolor{clr-lightgray}{HTML}{A5ACB2}
\renewcommand{\familydefault}{\sfdefault}


% Code colors
\colorlet{clr-code-keyword}{clr-primary}
\colorlet{clr-code-comment}{clr-lightgray}
\definecolor{clr-code-bg}{HTML}{EFF0F1}
\definecolor{clr-code-string}{HTML}{992E2E}


% listings default style for code
\lstset{
    language={python},
    breaklines=true,
    backgroundcolor=\color{clr-code-bg},
    basicstyle=\small\ttfamily,
    framesep=10pt,
    commentstyle=\color{clr-code-comment},
    keywordstyle=\color{clr-code-keyword}\bfseries,
    stringstyle=\color{clr-code-string},
    numberstyle=\color{clr-code-string},
    showstringspaces=false,
    rulecolor=\color{clr-code-bg},
    xleftmargin=10pt,
    xrightmargin=10pt,
    frame=single,
}


\definecolor{bluekeywords}{rgb}{0.13, 0.13, 1}
\definecolor{greencomments}{rgb}{0, 0.5, 0}
\definecolor{redstrings}{rgb}{0.9, 0, 0}
\definecolor{graynumbers}{rgb}{0.5, 0.5, 0.5}


% show colorbox under code words used in paragraphs
\let\oldlstinline\lstinline
\renewcommand{\lstinline}[1]{\colorbox{clr-code-bg}{\oldlstinline{#1}}}


% First page big format
\makeatletter
\def\@maketitle{
    \null
    \vfill
    \begin{center}\leavevmode
        \normalfont
        {\LARGE\raggedleft \@author\par}%
        {\color{clr-primary}\hrulefill\par}
        {\huge\raggedright \@title\par}%
    \vskip \fill
    {\Large \@date\par}%
    \end{center}%
    \null
    \thispagestyle{empty}%
    \clearpage
    \pagenumbering{arabic}
}
\def\@maketitle{
    \begin{center}
        {\Huge Universita degli Studi di Parma}
        \\[2.5em]
        \includegraphics{logo.png}
        \\[2.5em]
        {\Large DIPARTIMENTO DI INGEGNERIA ED ARCHITETTURA}
        \\[1.5em]
        {\Large Corso di Laurea di ingegneria Informatica, Elettronica e delle Telecomunicazioni}
        \\[1em]
        {\color{clr-primary}\hrulefill\par}
        \vfill
        {\Huge\@title}

    \end{center}
    \vskip\fill
    {
        \Large
        \textbf{Relatore:}
        \hfill
        \textbf{Tesi di laurea di:}
        \\[.2em]
        Prof. Ing. Poggi Agostino
        \hfill
        Corradi Alessandro
    }
    \bigskip
    \begin{center}
        {\Large A.A. 2019/2020}
    \end{center}
    \null
    \thispagestyle{empty}
    \clearpage
}
\makeatother


% Underlined big section
\titleformat{\section}
    {\color{black}\Huge}
    {}
    {0em}
    {}[\color{clr-lightgray}\titlerule]
\titlespacing{\section}{0em}{0em}{2em}


% New page on new section
\newcommand{\sectionbreak}{\clearpage}


% Blue subsections
\titleformat{\subsection}
    {\color{clr-primary}\large\bfseries}
    {}
    {0em}
    {}


% No numbers in subsubsections
\titleformat{\subsubsection}
    {\color{black}\bfseries\normalsize}
    {}
    {0em}
    {}

% Hide section numbers in table of contents
\makeatletter
\let\latexl@section\l@section
\def\l@section#1#2{\begingroup\let\numberline\@gobble\latexl@section{#1}{#2}\endgroup}
\makeatother

% Hide subsection number in table of contents
\makeatletter
\let\latexl@subsection\l@subsection
\def\l@subsection#1#2{\begingroup\let\numberline\@gobble\latexl@subsection{#1}{#2}\endgroup}
\makeatother

\renewcommand{\footnoterule}{%
  \kern 3pt
  {
      \color{clr-lightgray}
      \hrule width \textwidth height .5pt
  }
  \kern 5pt
}
% Paragraph styling
\setlength\parindent{0em}
\setlength\parskip{1em}

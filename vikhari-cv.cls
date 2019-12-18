%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vikhari CV LaTeX Template
% Original Author: knyte (https://github.com/knyte)
% XeLaTeX Template Version 1.1 (09.05.2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% FRONTMATTER

% Class Specifications
\ProvidesClass{vikhari-cv}[2019/12/15 class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTS, CLASS TWEAKS, & LAYOUT

% Graphics Imports
\usepackage{graphicx}   %Used for including graphics.
\usepackage{tikz}       %Used for cropping header graphic to a circle.

% Tweak Article Class
\pagenumbering{gobble}
\setlength{\topsep}{0pt}
\setlength{\partopsep}{0pt}
\setlength{\parskip}{0pt}

% Tablular Layout
\usepackage{tabularx,tabulary}
\newcolumntype{s}{>{\raggedright\hsize=2\hsize}l}%Section column.
\usepackage[hmargin=0.4in, vmargin=0.4in]{geometry}

% Miscellaneous
\usepackage{verbatim}   %Enable multi-line comments.
%\usepackage{embedall}  %Embeds all images, source, and listings in PDF.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOR & FONT SETTINGS

% Color
% Custom colors are based on my logo (do your own!) and
% color blind accessibility (bright red and dark green).
\usepackage{xcolor}
\definecolor{vhpcyan}{RGB}{0,212,255}           %href - header/contact.
\definecolor{vhpgreen}{RGB}{39,134,100}         %href - IT/software dev. 
\definecolor{vhppurple}{RGB}{38,48,108}         %hyperlink - internal.
\definecolor{vhpred}{RGB}{201,62,62}            %href - cybersec hax.
\definecolor{vhpyellow}{RGB}{255,222,89}        %href - easter egg.

\usepackage[colorlinks = true,                  %Turn color on/off.
            linkcolor = red,                    %Default \hyperlink.
            urlcolor  = green,                  %Default \cite.
            citecolor = blue,                   %Default \href.
            anchorcolor = vhppurple]{hyperref}

\newcommand{\vhphref}[3][cyan]{\href{#2}{\color{#1}{#3}}}
\newcommand{\vhphype}[2]{\hyperlink{#1}{\color{vhppurple}{\fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont#2}}}

% Font
\usepackage{fontspec}
\setmainfont[Color=black,
             Scale=MatchLowercase,
             Ligatures=TeX,
             Path=resources/fonts/PT_Sans/,
             BoldItalicFont=PT_Sans-Web-BoldItalic,
             BoldFont=PT_Sans-Web-Bold,
             ItalicFont=PT_Sans-Web-Italic]{PT_Sans-Web-Regular}
\setsansfont[Color=black,
             Scale=MatchLowercase,
             Ligatures=TeX,
             Path=resources/fonts/Muli/,
             BoldItalicFont=Muli-BoldItalic,
             BoldFont=Muli-Bold,
             ItalicFont=Muli-Italic]{Muli-Light}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENVIRONMENTS

%% Header
\newenvironment{header}[1]{
     \centering
     \hrulefill\\[1ex]
}{
     \hrulefill\\[1ex]
}

%% Entry Tab
\newenvironment{entrytab}{
    \setlength{\topsep}{2pt}%
    \setlength{\partopsep}{0pt}%
    \tabbing
}{
    \endtabbing
}

%% Topic
\newcommand{\labeltab}{1.5in}
\newcommand{\datetab}{6.2in}
\newenvironment{topic}[1]{
    \begin{entrytab}
        \hspace*{\labeltab}\= \hspace*{\datetab}\= \kill
        \sechead{#1}
}{
    \\[-6.5ex]
    \end{entrytab}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER COMMANDS

%%% Site
\newcommand{\site}[3]{
    \fontsize{8.5pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Bold}\selectfont
    \MakeUppercase{#1}
    \fontsize{10pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont
    \vhphref[vhpcyan]{3}{#2}
}

%%% Site Pic
\newcommand{\sitepic}[3]{
    #1
    \fontsize{10pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont
    \vhphref[vhpcyan]{3}{#2}
}

%% Make Header
\newcommand{\makeheader}[1]{
	\begin{minipage}[c][]{0.3\linewidth}
	\begin{flushleft}
    	\begin{tikzpicture}
            \clip (0,0)  circle (2.35cm);
            \node[name=VHP, anchor=center] at (0,0.007) {
                \centering
                \includegraphics[scale=0.23]{resources/images/rami-freddie.jpg}
                %Adjust this coordinate to move image.
            };
        \end{tikzpicture}
    \end{flushleft}
    \end{minipage}
    \begin{minipage}[c][]{0.6\linewidth}
    \begin{flushright}
            \centering{
            \color{black}
            \fontsize{60pt}{60pt}
            \fontspec[Path=resources/fonts/Muli/]{Muli-Bold}\selectfont #1
            }
    \end{flushright}
	\end{minipage}
	\\[0.2ex]
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT COMMANDS

%%% Section Header
\newcommand{\sechead}[1]{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/Muli/]{Muli-Regular}\selectfont #1
}

%%% Section Subsection
\newcommand{\subsec}[1]{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Bold}\selectfont #1
}

%%% Short Description
\newcommand{\shortdesc}[1]{
    \fontsize{9pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]
    {PT_Sans-Web-Italic}\selectfont{#1}
}

%%% Content
\newcommand{\content}{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont
}

%%% Content Italics
\newcommand{\contentit}{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Italic}\selectfont
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENTRY COMMANDS

%%% Entry Space
\newcommand{\entryspace}{6pt}

%%% Entry Description Tab
\newcommand{\entrydesc}{6.05in}

%% Entry 4-Tier
\newcommand{\entryFour}[4]{
    \> \subsec{#1} \> \content{#2} \' \\
    \>\shortdesc{#3}\\
    [\entryspace]
    \>\ 
        \begin{minipage}{\entrydesc}
            \content{#4} \\
        \end{minipage}\\
}

%% Entry 3-Tier
\newcommand{\entryThree}[3]{
    \> \subsec{#1} \> \content{#2} \' \\
    \>\ 
        \begin{minipage}{\entrydesc}
            \content{#3} \\
        \end{minipage}\\
}

%% Entry 2-Tier
\newcommand{\entryTwo}[2]{
    \> \contentit{#1:} \> \\
    \>\ 
        \begin{minipage}{\entrydesc}
            \content{#2} \\
        \end{minipage}\\
}

%% Entry 1-Tier
\newcommand{\entryOne}[1]{
        \begin{minipage}[t]{\entrydesc}
            \content{#1} \\
        \end{minipage}\\
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
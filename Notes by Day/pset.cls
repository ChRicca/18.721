%%
%% This is file `pset.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% pset.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2010 by Jason Gross
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{pset}
 [2011/02/20 v0.3b PSet Template]
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{comment}
\RequirePackage{ifdraft}
\RequirePackage{xifthen}
\RequirePackage{etextools}[2010/12/07]
\newif\if@final
\ifdraft{\@finalfalse}{\@finaltrue}
\newif\if@showproblem

\if@final
  \@showproblemfalse
\else
  \@showproblemtrue
\fi
\newif\if@usegeometry
\@usegeometrytrue
\newif\if@separatepages\newif\if@exam
\@separatepagesfalse\@examfalse
\DeclareOption{separatepages}{\@separatepagestrue}
\DeclareOption{showproblems}{\@showproblemtrue}
\DeclareOption{hideproblems}{\@showproblemfalse}
\DeclareOption{nogeometry}{\@usegeometryfalse}
\DeclareOption{geometry}{\@usegeometrytrue}
\DeclareOption{exam}{\@examtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}% \LoadClassWithOptions{article}
\if@usegeometry
  \RequirePackage[margin=1in]{geometry}
\fi
\ExpandNext{\def\pset@question@begin#1}{\expandnext{\noexpand\ifstrcmp{#1}{question}{%
  \PackageError{pset}{Environment question not permitted to nest.  Inserting missing \string\end\string{question\string}.}%
    {Question environments are like sections; you can't nest a section inside another one (you'd need a subsection).}%
  \end{question}}}{%
    \begin{#1}%
  }%
}

\newenvironment{question}[1][]{%
 \section{#1}
   \if@showproblem
     \newenvironment{problem}{\subsection*{Problem}}{}%
     \newenvironment{solution}{\subsection*{Solution}}{}%
   \else
     \excludecomment{problem}%
     \newenvironment{solution}{}{}%
   \fi
  \let\begin=\pset@question@begin
}{\if@separatepages\cleardoublepage\fi}
\newenvironment{question*}[1][]{%
 \section*{#1}
  \if@showproblem
    \newenvironment{problem}{\subsection*{Problem}}{}%
    \newenvironment{solution}{\subsection*{Solution}}{}%
  \else
    \excludecomment{problem}%
    \newenvironment{solution}{}{}%
  \fi
  \let\begin=\pset@question@begin
}{\if@separatepages\cleardoublepage\fi}
\newcommand*{\duedate}[1]{\gdef\@duedate{#1}}
\newcommand*{\psetnum}[1]{\gdef\@psetnum{#1}}
\newcommand*{\classnumber}[1]{\gdef\@classnumber{#1}}
\newcommand*{\classname}[1]{\gdef\@classname{#1}}
\newcommand*{\professor}[1]{\gdef\@professor{#1}}
\newcommand*{\collaborators}[1]{\gdef\@collaborators{#1}}
\newcommand*{\recitation}[2][]{\gdef\@recitation{#2}\xifblank{#1}{\gdef\@shortrecitation{#2}}{\gdef\@shortrecitation{#1}}}
\let\@recitation\relax
\let\@shortrecitation\relax
\let\@collaborators\relax
\AtBeginDocument{
  \pagestyle{fancy}
  \ifthenelse{\equal{\@collaborators}{}}{\let\@collaborators\relax}{}
  \ifx\relax\@collaborators
    \headheight 13.6pt\relax
  \else
    \headheight 25.3pt\relax
  \fi
  \fancyhead{}
  \fancyfoot{}

  \begingroup
    \def\fullexpand#1{{\edef\@temp{#1}\expandafter}\@temp}
  \expandafter\endgroup
  \fullexpand{%
    \noexpand\lhead{\@author \ifx\relax\@collaborators\else \noexpand\\ Collaborators: \expandafter\@collaborators\fi}
    \noexpand\rhead{\@duedate \ifx\relax\@collaborators\else \noexpand\\ \fi}
    \noexpand\chead{\@classnumber\noexpand\space \if@exam Exam \else P-Set \fi \@psetnum \ifx\relax\@shortrecitation\else\space(\@shortrecitation)\fi \ifx\relax\@collaborators\else \noexpand\\ \fi}
    \noexpand\cfoot{\noexpand\thepage\noexpand\space of \noexpand\pageref{LastPage}}
  }%
  \begingroup
    \begin{center}%
      {\noindent \fontsize{21}{21}\selectfont \@classnumber: \@classname{} (\@professor), \if@exam Exam \else Problem Set \fi\@psetnum}%
    \end{center}%
  \endgroup
  }
\endinput
%%
%% End of file `pset.cls'.

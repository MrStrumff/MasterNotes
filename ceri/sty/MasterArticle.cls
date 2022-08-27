% ----------------------
% Classe pour les article style "prises de notes au master"
% v1.3 - 12/09/2021
%
% Alexis Pic - inspiré de la classe de Vincent Labatut
% <https://www.overleaf.com/latex/templates/modele-de-rapport-avignon-universite/pdbgdpzsgwrt>
%
% Palettes provided from
% <https://coolors.co/>
%
% Compile with XeLaTeX
% ----------------------

% ----------------------
% INIT CLASS
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ceri/sty/MasterArticle}%[v1.1 - 06/10/2020]
\LoadClass[a4paper, 11pt, leqno]{article}                          % based on the article LaTeX class
% ----------------------

% ----------------------
% TITLE PAGE
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{calc}
%\RequirePackage{anyfontsize}
\RequirePackage[export]{adjustbox}

\makeatletter
\newcommand\MakeTitleX{
    \begin{center}
        {\Large Université de Nice \hfill \@date\\
        Faculté des sciences \hfill\@author}
        \rule{\textwidth}{1pt}

        \vspace{1cm}

        {\fontsize{30}{40}\selectfont\bfseries\MakeUppercase\@title}
    \end{center}

    \vspace{.25cm}

    \noindent\resizebox{\textwidth}{!}{
        \begin{tikzpicture}% fg, fg2, th, defini, rema, coro
            \draw[line width=.07cm, fg](-1cm,0)--(3cm,0);
            \draw[line width=.07cm, fg2](3cm,0)--(4.5cm,0);
            \draw[line width=.07cm, th](4.5cm,0)--(6.5cm,0);
            \draw[line width=.07cm, defini](5.5cm,0)--(6.25cm,0);
            \draw[line width=.07cm, rema](6.25cm,0)--(6.85cm,0);
            \draw[line width=.07cm, coro](6.85cm,0)--(7.35cm,0);
        \end{tikzpicture}
    }

    \vspace{1cm}
    \setHeaders
    \thispagestyle{empty}
}
\makeatother

\renewcommand\maketitle\MakeTitleX
% ----------------------

% ----------------------
% INIT FONTS
\RequirePackage[french]{babel}
\RequirePackage[no-math]{fontspec} % 'no-math' for the rendering issue
\RequirePackage{mathtools}
\RequirePackage[notext,not1]{stix2}
\RequirePackage[bb=ams]{mathalpha}  % use 'Mathtime Pro 2 Holey Roman' blackboard bold letters

\setsansfont{Roboto}[                       % set up custom font
    Extension = .ttf,
    Path = ../ceri/fonts/Roboto/,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic
]
\renewcommand{\familydefault}{\sfdefault}   % use the sans-serif font
% ----------------------

% ----------------------
% INIT PAPER
\RequirePackage[top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm]{geometry}

\RequirePackage[french]{varioref}           % improves cross-refs
% ----------------------

% ----------------------
% INIT MATH
\makeatletter
\count@=`A \advance\count@\m@ne
\@whilenum\count@<`Z\do{%
  \advance\count@\@ne
  \begingroup\uccode`a=\count@
  \uppercase
    {\endgroup\DeclareMathSymbol{a}}
    {\mathalpha}
    {operators}
    {\count@}
}
\RequirePackage{pstricks-add}
\makeatother % Makes Capital letters in Roman as default in formulas
% ----------------------

% ----------------------
% CAPTION SETTINGS
\RequirePackage{caption}                    % caption customization
\captionsetup{
    labelfont={color=fg, bf, small},    % font(sf), color, bold, size of the caption label
    textfont={small},                       % font(sf) and size of the caption text itself
    labelsep=period,                        % separator between label and text
    margin=10mm                             % left/right margins
}
\DeclareCaptionType{fileText}[Fichier][Liste de fichiers]
\DeclareCaptionType{consoleText}[Console][Liste de sorties console]
% ----------------------

% ----------------------
% FOOTNOTES AND ITEMIZING
\RequirePackage{enumitem}

\AddThinSpaceBeforeFootnotes
\FrenchFootnotes
\RequirePackage{footnotebackref} % For cluckable footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}} % Using symbols for footnotes
% ----------------------

% ----------------------
% HEADER/FOOTER SETTINGS
\RequirePackage{lastpage}                   % computes the number of pages
\RequirePackage{fancyhdr}                   % changes headers and setters
\setlength{\headheight}{14pt}               % increases header size
% ----------------------

% ----------------------
% COLOR SETTINGS (DEFAULT COLORS)
%\RequirePackage{luacolor}                       % prevent color changes at page breaks
%
\definecolor{fg}{RGB}{233,82,70}                      % headers and hyperlinks
\definecolor{fgDark}{RGB}{91,27,22}             % text color in console (draft mode)
\definecolor{fgDarker}{RGB}{51,8,6}             % background color in console
\definecolor{fgLight}{RGB}{241,167,159}         % table header rows
\definecolor{fgVeryLight}{RGB}{248,226,224}     % table normal rows
\definecolor{fgYellow}{RGB}{250,165,25}
\definecolor{fgText}{RGB}{0,0,0}                % text
\definecolor{bg}{RGB}{255,255,255}              % Background
\definecolor{fg2}{RGB}{0,0,0}                           % 2nd foreground
\definecolor{fgDeep}{RGB}{238,42,36}
\definecolor{fgLightYellow}{RGB}{229,208,66}
\definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
%
\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}    % title page
\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
\definecolor{BaseColor}{rgb}{0.64,0.69,0.31}

\makeatletter
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color
}
\makeatother

\globalcolor{fgText} % Changes text color

\makeatletter
\newcommand{\setHeaders}{                   % macro initializing the headers and footers
    \pagestyle{fancy}
    \fancyhf{}
    %\lhead{\textcolor{fgText}{\@author}}
    \chead{\textcolor{fgText}{\@title}}
    \rhead{\textcolor{fgText}{\@author}}
    \cfoot{\textcolor{fgText}{\thepage\ / \pageref*{LastPage}}}
    \renewcommand\headrule{                 % color and thickness of the header rule
        {\color{fgText}\hrule width \hsize}}
    \renewcommand\footrule{                 % color and thickness of the header rule
        {\color{fgText}\hrule width \hsize} \kern 1mm}
}
\makeatother
% ----------------------

% ----------------------
% CUSTOM SECTION HEADERS
\RequirePackage{titlesec}

\newcommand{\chapimage}[1]{%
  \def\thetitlepicture{#1}%
}

\titleformat{\section}
    {\color{fg}\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}

\titleformat{\subsection}
    {\color{fg}\normalfont\large\bfseries}
    {\thesubsection}
    {1em}
    {}

\titleformat{\subsubsection}
    {\color{fg}\normalfont\normalsize\bfseries}
    {\thesubsubsection}
    {1em}
    {}

%\renewcommand{\thechapter}{\Roman{chapter}}
\setcounter{secnumdepth}{4}
\renewcommand{\theequation}{\arabic{equation}}
\renewcommand{\thesubsection}{\normalfont\bfseries\arabic{section}.\arabic{subsection}}
\renewcommand{\theparagraph}{\alph{paragraph}.}

%\setcounter{secnumdepth}{5}            % number subsubsections
%\setcounter{tocdepth}{5}               % and include them in the TOC
%\setcounter{secnumdepth}{3}             % number subsubsections
%\setcounter{tocdepth}{3}                % and include them in the TOC
% NOTE: only (?) for the report class
%   \RequirePackage{chngcntr}           % defines specific counters
%   \counterwithout{section}{chapter}   % hide the chapter number in section headings
% ----------------------

%\RequirePackage[notext]{stix2}

% ----------------------
% MATH MACROS
\RequirePackage[all]{xy} % Math Diagrams

% Useful commands
\newcommand{\R}{\mathbf{R}}
\newcommand{\C}{\mathbf{C}}
\newcommand{\Q}{\mathbf{Q}}
\newcommand{\Z}{\mathbf{Z}}
\newcommand{\N}{\mathbf{N}}
\newcommand{\K}{\mathbf{K}}
\renewcommand{\d}{\mathrm{d}}

\newcommand{\intervalle}[4]{\mathopen{#1}#2\mathclose{}\mathpunct{},#3\mathclose{#4}}
\newcommand{\intff}[2]{\intervalle{[}{#1}{#2}{]}}
\newcommand{\intof}[2]{\intervalle{]}{#1}{#2}{]}}
\newcommand{\intfo}[2]{\intervalle{[}{#1}{#2}{[}}
\newcommand{\intoo}[2]{\intervalle{]}{#1}{#2}{[}}

\newcommand{\mi}[1]{\mathnormal{#1}} % Renders in italic letters (roman is default for capitals)

\newcommand{\fig}[1]{ % Includes an external .tex graph (output from GeoGebra)
    %\begin{figure}[!h]
        \begin{center}
            \include{graphs/#1}
        \end{center}
        %\caption{#2}\label{#3}
    %\end{figure}
}
% ----------------------

% ----------------------
% CODE ENVIRONMENT
\RequirePackage{minted}
\usemintedstyle{monokai}

\definecolor{bgcode}{HTML}{282828}

\newenvironment{python}{\VerbatimEnvironment\begin{minted}[
    linenos,
    mathescape,
    bgcolor = bgcode,
    frame=lines,
    framesep=2mm
]{python}}{\end{minted}}
\newenvironment{cpp}{\VerbatimEnvironment\begin{minted}[
    linenos,
    mathescape,
    bgcolor = bgcode,
    frame=lines,
    framesep=2mm
]{cpp}}{\end{minted}}
% ----------------------


% ----------------------
% THEOREM BOXES
\RequirePackage{amsthm}
\RequirePackage[framemethod=default]{mdframed}

\newcommand\DefaultFrame[2]{
    \newmdenv[skipabove=2pt,
    skipbelow=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=#1,
    backgroundcolor=bg,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=-5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt,
    innerbottommargin=3pt]{#2Box}
}
\newcommand\DefaultFrameStar[2]{
    \newmdenv[skipabove=2pt,
    skipbelow=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=#1,
    backgroundcolor=bg,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=-5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt,
    innerbottommargin=3pt]{#2Box*}
}
\newcommand\DefaultFrameMult[2]{
    \newmdenv[skipabove=2pt,
    skipbelow=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=#1,
    backgroundcolor=bg,
    innerleftmargin=5pt,
    innerrightmargin=5pt,
    innertopmargin=-5pt,
    leftmargin=0cm,
    rightmargin=0cm,
    linewidth=4pt,
    innerbottommargin=3pt]{#2Boxs}
}

\newtheoremstyle{lemme}{3pt}{3pt}{\itshape}{}{\itshape}{.}{.5em}{}

\newcommand{\MakeThEnv}[4]{

    \DefaultFrame{#1}{#2}

    \theoremstyle{#3}
    \newtheorem{#2T}{#4}

    \newenvironment{#2}{\begin{#2Box}\begin{#2T}}{\end{#2T}\end{#2Box}}
}
\newcommand{\MakeThEnvStar}[4]{

    \DefaultFrameStar{#1}{#2}

    \theoremstyle{#3}
    \newtheorem*{#2T*}{#4}

    \newenvironment{#2*}{\begin{#2Box*}\begin{#2T*}}{\end{#2T*}\end{#2Box*}}
}

\newcommand{\MakeMultEnv}[4]{

    \DefaultFrameMult{#1}{#2}

    \theoremstyle{#3}
    \newtheorem{#2Ts}{#4}

    \newenvironment{#2s}{\begin{#2Boxs}\begin{#2Ts}\hfill\begin{enumerate}[wide]}{\end{enumerate}\end{#2Ts}\end{#2Boxs}}
}

\newcommand{\MakeDmEnv}[1]{
    \DefaultFrame{#1}{demo}
    %\theoremstyle{definition}
    %\newtheorem{demoT}{Démonstration}
    \newenvironment{demo}{\begin{demoBox}\begin{proof}}{\end{proof}\end{demoBox}}
}

\newenvironment{sub}[1]{\begin{enumerate}[label=#1,wide]}{\end{enumerate}}
\newenvironment{subex}{\begin{sub}{\alph*)}}{\end{sub}}
\newenvironment{subth}{\begin{sub}{(\roman*)}}{\end{sub}}

\definecolor{dRed}{RGB}{128,0,64}

\DefaultFrame{DarkGrey}{ex}
\DefaultFrame{dRed}{exo}

\theoremstyle{definition}

\newtheorem*{exT}{Exemple}
\newtheorem*{exTs}{Exemples}
\newtheorem*{exoT}{Exercice}
\newtheorem*{exoTs}{Exercices}

\newenvironment{ex}{\begin{exBox}\begin{exT}}{\end{exT}\end{exBox}}
\newenvironment{exs}{\begin{exBox}\begin{exTs}\hfill\begin{enumerate}[wide]}{\end{enumerate}\end{exTs}\end{exBox}}
\newenvironment{exo}{\begin{exoBox}\begin{exoT}}{\end{exoT}\end{exoBox}}
\newenvironment{exos}{\begin{exoBox}\begin{exoTs}\hfill\begin{enumerate}[wide]}{\end{enumerate}\end{exoTs}\end{exBox}}
% ----------------------


% ---------------------- OPTIONS ----------------------
% ----------------------
% COLOR OPTIONS
\newcommand\ColorSetup[6]{
	    \definecolor{fg}{HTML}{#1}			       % headers and hyperlinks
	    \definecolor{fgText}{HTML}{000000}                % Text
	    \definecolor{bg}{HTML}{FFFFFF}                 % Background
	    \definecolor{fg2}{HTML}{#2}
	    \definecolor{th}{HTML}{#3}
	    \definecolor{defini}{HTML}{#4}
	    \definecolor{rema}{HTML}{#5}
	    \definecolor{coro}{HTML}{#6}

        %\definecolor{codecom}{HTML}{#8}
        %\definecolor{codebg}{HTML}{#9}
        %\definecolor{codekey}{HTML}{#10}
        %\definecolor{codestr}{HTML}{#11}
        %\definecolor{codenum}{HTML}{222222}

	    % Syntax : \MakeThEnv{color}{env-name}{theorem-style}{title}
	    \MakeThEnv{th}{theo}{plain}{Théorème}
        \MakeThEnvStar{th}{theo}{plain}{Théorème}
	    \MakeThEnv{defini}{defin}{definition}{Définition}
        \MakeThEnvStar{defini}{defin}{definition}{Définition}
        \MakeThEnvStar{rema}{rem}{remark}{Remarque}
	    \MakeThEnv{rema}{rem}{remark}{Remarque}
        \MakeMultEnv{rema}{rem}{remark}{Remarques}
        \MakeThEnv{th}{propo}{plain}{Proposition}
	    \MakeThEnvStar{th}{propo}{plain}{Proposition}
	    \MakeThEnv{fgText}{lem}{lemme}{Lemme}
        \MakeThEnvStar{fgText}{lem}{lemme}{Lemme}
        \MakeThEnv{coro}{coro}{definition}{Corollaire}
	    \MakeThEnvStar{coro}{coro}{definition}{Corollaire}
	    \MakeDmEnv{bg}
}

% Option commands in "options.sty" file

\input{../ceri/sty/options.sty}
% ----------------------

% ----------------------
% FINISH
% \ExecuteOptions{ikea} % Default color palette
% \ExecuteOptions{\CurrentOption}
\ProcessOptions\relax
% ----------------------
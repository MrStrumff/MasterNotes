% ----------------------
% Classe pour les notes prises au master
% v1.2 - 18/11/2020
%
% Alexis Pic - inspiré de la classe de Vincent Labatut
% <https://www.overleaf.com/latex/templates/modele-de-rapport-avignon-universite/pdbgdpzsgwrt>
% et couverture de LaTeXDraw.com <https://latexdraw.com/stylish-latex-cover-page/#tab-con-3> (toujours dans le code mais inutilisée depuis la version 1.1)
%
% Palettes provided from
% <https://coolors.co/>
%
% Compile with XeLaTeX
% ----------------------

% ----------------------
% INIT CLASS
\NeedsTeXFormat{LaTeX2e}
%\ProvidesClass{ceri/sty/MasterNotes}[v1.1 - 06/10/2020]
\LoadClass[a4paper, 11pt, leqno]{book}                          % based on the book LaTeX class
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
\newcommand{\MakeTitleZ}{% ANOTHER TYPE OF TITLEPAGE (UNUSED)

    % draw title page
    \begin{titlepage}
        \pagestyle{empty}
        % Background color
        \begin{tikzpicture}[remember picture,overlay]
            \fill[fg] (current page.south west) rectangle (current page.north east);
            % Background Hexagon
            \begin{scope}
                \foreach \i in {2.5,...,22}
                {\node[rounded corners,fg!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.west)+(2.5,-5)$) {} ;}
            \end{scope}
            \foreach \i in {0.5,...,22}
            {\node[rounded corners,fg!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north west)+(2.5,0)$) {} ;}
            \foreach \i in {0.5,...,22}
            {\node[rounded corners,fg!98,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north east)+(0,-9.5)$) {} ;}
            \foreach \i in {21,...,6}
            {\node[fg!95,rounded corners,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.south east)+(-0.2,-0.45)$) {} ;}
            % Title of the Report
            \node[left,fg!5,minimum width=0.625*\paperwidth,minimum height=3cm, rounded corners] at ($(current page.north east)+(0,-9.5)$){{\fontsize{25}{30} \selectfont \bfseries \@title}};
            % Subtitle
            \node[left,fg!10,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-11)$){{\huge \textit{}}};%\@author}}};
            % Author Name
            \node[left,fg!5,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-13)$){{\Large \textit{\@author}}};
            % Year
            \node[rounded corners,fill=fg!95,text=fg!5,regular polygon,regular polygon sides=6, minimum size=2.5 cm,inner sep=0,ultra thick] at ($(current page.west)+(2.5,-5)$) {\LARGE \bfseries \@date};
        \end{tikzpicture}
    \end{titlepage}

    % restore settings
    \pagecolor{bg}
    \setcounter{page}{2}                                        % set the second page... to number 2
    \thispagestyle{fancy}                                       % force header/footer
    \setHeaders
    \newpage
}
\makeatother

\makeatletter
\newcommand{\makeTitleX}{% RIGHT TITLEPAGE
    % draw title page
    \begin{titlepage}
        \pagestyle{empty}
        \begin{center}
            \pagecolor{fg}
            \begin{tikzpicture}[remember picture,overlay]
              \node[anchor=north west,inner sep=0pt] at ($(current page.north west)$) {
                 \includegraphics[trim={0 5cm 0 0},
                 width=\paperwidth]{ceri/images/universe.jpg}
              };
            \end{tikzpicture}

            \vspace{9.5cm}

            \color{bg}

            {\Large Université de Nice - Faculté des Sciences}
            \vspace{1cm}

            {\fontsize{50}{60}\selectfont\bfseries\MakeUppercase\@title}
            \vspace{0.5cm}
            \rule{\textwidth-3cm}{1pt}

            \vspace{.5cm}

            {\Large\@author}
            \vfill

            {\large \textit{Prises de notes d'Alexis Pic}
            \vspace{1cm}

            \textbf{\@date}}
        \end{center}
    \end{titlepage}
    % restore settings
    \pagecolor{bg}
    \color{fgText}
    \setcounter{page}{2}                                        % set the second page... to number 2
    \thispagestyle{fancy}                                       % force header/footer
    \setHeaders
    \newpage
}
\makeatother

%\renewcommand\maketitle\MakeTitleZ
\renewcommand\maketitle\makeTitleX
% ----------------------

% ----------------------
% INIT FONTS
\RequirePackage[french]{babel}
\RequirePackage[no-math]{fontspec} % 'no-math' for the rendering issue
\RequirePackage{mathtools}
\RequirePackage[notext,not1]{stix2}

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
%\definecolor{fg}{RGB}{233,82,70}                      % headers and hyperlinks
%\definecolor{fgDark}{RGB}{91,27,22}             % text color in console (draft mode)
%\definecolor{fgDarker}{RGB}{51,8,6}             % background color in console
%\definecolor{fgLight}{RGB}{241,167,159}         % table header rows
%\definecolor{fgVeryLight}{RGB}{248,226,224}     % table normal rows
%\definecolor{fgYellow}{RGB}{250,165,25}
\definecolor{fgText}{RGB}{0,0,0}                % text
%\definecolor{bg}{RGB}{255,255,255}              % Background
%\definecolor{fg2}{RGB}{0,0,0}                           % 2nd foreground
%\definecolor{fgDeep}{RGB}{238,42,36}
%\definecolor{fgLightYellow}{RGB}{229,208,66}
%\definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
%%
%\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}    % title page
%\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
%\definecolor{BaseColor}{rgb}{0.64,0.69,0.31}

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
    \lhead{\textcolor{fgText}{\leftmark}}
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

%\makeatletter
%    \def\@partimage{}
%    \newcommand{\partimage}[1][]{\gdef\@partimage{\includegraphics[width=\textwidth, height=\textheight, keepaspecratio]{#1}}}
%    \renewcommand{\printparttitle}[1]{\parttitlefont #1\vfil\@partimage\vfil\gdef  \@partimage{}}
%\makeatother

%\titleformat{\part}%[display]
%    {\fontsize{20pt}{12pt}\textcolor{white}\bfseries\selectfont\filleft}
%    {}
%    {20pt}
%    {\vfill}
%    [\vspace{3cm}]
%\let\partt\part

\newcommand{\partt}[2]{
    \newpage
    \pagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west,inner sep=0pt] at ($(current page.north west)$) {
                 \includegraphics[%trim={0 5cm 0 0},
                 height=\paperheight]{#2}
              };
    \end{tikzpicture}
    \vfill
    %\definecolor{bg}{HTML}{FFFFFF}                 % Background
    \addtocounter{part}{1}
    {\fontsize{38pt}{12pt}\bfseries
    \textbf{\color{bg}Partie \thepart\hfill\\\hfill #1}}
    %\vspace{}
    \addtocounter{page}{2}
    %\thispagestyle{fancy}                                       % force header/footer
    %\setHeaders
    \newpage
    \setHeaders

}

\titleformat{\chapter}
  {\bfseries\printcurrentpicture\color{fg2}\normalfont\Huge\bfseries\scshape}
  {}
  {1em}
  {\makebox[0cm][r]{\thechapter\hspace{15pt}}}

\titlespacing{\chapter}{0pt}{0pt}{20pt}

\newcommand{\printcurrentpicture}{%
  \vspace*{-\dimexpr\topskip+1in+\topmargin+\headheight+\headsep+\lineskip}%
  \moveleft\dimexpr\oddsidemargin+1in\vbox{%
    \hbox{%
      \includegraphics[width=\paperwidth]{\thetitlepicture}%
    }
    \vspace{20pt}
  }%
}

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

\renewcommand{\thechapter}{\Roman{chapter}}
\setcounter{secnumdepth}{4}
\renewcommand{\theequation}{\arabic{equation}}
\renewcommand{\thesubsection}{\normalfont\Roman{chapter}.\arabic{section}.\arabic{subsection}}
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
\newenvironment{subth}{\begin{sub}{\textnormal{(\roman*)}}}{\end{sub}}

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
\ExecuteOptions{grape} % Default color palette
\ProcessOptions\relax
% ----------------------
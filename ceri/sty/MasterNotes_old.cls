% ----------------------
% Classe pour les notes prises au master
% v1.0 - 19/07/2020
%
% Alexis Pic - classe de Vincent Labatut 
% <https://www.overleaf.com/latex/templates/modele-de-rapport-avignon-universite/pdbgdpzsgwrt>
% et couverture de LaTeXDraw.com <https://latexdraw.com/stylish-latex-cover-page/#tab-con-3>
%
% Compilation avec LuaLaTeX.
% ----------------------

% ----------------------
% INIT CLASS
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MasterNotes}[Classe de notes]
\LoadClass[a4paper, 11pt, final]{book} % based on the book LaTeX class
% ----------------------

% ----------------------
% ENCODING STUFF
\RequirePackage[english, french]{babel}
\frenchbsetup{StandardLists=true} % à inclure si on utilise \usepackage[french]{babel}
\RequirePackage{fontspec}
\RequirePackage{soul}
% ----------------------

% ----------------------
% FONT SETTINGS
% \RequirePackage{luatexbase} % Used for TeXLive
\RequirePackage[babel=true]{microtype} % Typographical refinements
\RequirePackage{lmodern} % Uses better fonts (?)
\setsansfont{NotoSans}[                       % set up custom font
    Extension = .ttf,
    Path = ceri/fonts/,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic
]
\renewcommand{\familydefault}{\sfdefault}	% use the sans-serif font
%
\RequirePackage{xspace}						% add missing spaces
\RequirePackage{icomma}						% no space inserted after commas in expressions such as 1,23 (French)
\RequirePackage{eurosym}					% euro symbol (€)
\RequirePackage{textcomp}					% degree character (°)
\RequirePackage{pifont}                     % dingbat characters
\newcommand{\cmark}{\ding{51}}              % command for check mark
\newcommand{\xmark}{\ding{55}}              % command for matching cross mark
\RequirePackage{relsize}                    % define relative font sizes
% ----------------------

% ----------------------
% MIDDLE DOT
\RequirePackage{newunicodechar}
\newunicodechar{·}{\ensuremath{{\cdot}}}   % possibly unnecessary with appropriate font
% ----------------------

% ----------------------
% TITLEPAGE FORMATING
\RequirePackage{graphicx}					% improves \includegraphics
\sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}
% ----------------------

% ----------------------
% SPACE-RELATED SETTINGS
\RequirePackage[top=2.5cm, 
	bottom=2.5cm, 
    left=2.5cm, 
    right=2.5cm]{geometry}					% changes document margins
\RequirePackage{setspace}					% controls spacing between lines
% ----------------------

% ----------------------
% MISC
\RequirePackage[french]{varioref} 			% improves cross-refs
\RequirePackage{lipsum}						% inserts filler text
\RequirePackage{xifthen}					% if/then expressions
\RequirePackage{printlen}					% displays lengths
\RequirePackage{xstring}					% handles strings functions
\RequirePackage{titling}					% better control over the title
\RequirePackage{authoraftertitle}			% accesses title and author names
\RequirePackage{datetime}					% custom date format
\RequirePackage{etoolbox}					% test if a macro value is empty
\RequirePackage{multicol}                   % switch to 2 columns
\RequirePackage{footmisc}                   % additional footnote features
% ----------------------

% ----------------------
% HEADER/FOOTER SETTINGS
\RequirePackage{lastpage}					% computes the number of pages
\RequirePackage{fancyhdr}					% changes headers and setters
\setlength{\headheight}{14pt}				% increases header size
% ----------------------

% ----------------------
% COLOR SETTINGS (DEFAULT COLORS)
\RequirePackage{luacolor}                       % prevent color changes at page breaks
\RequirePackage[table]{xcolor}			       	    % define custom colors
%
\definecolor{fg}{RGB}{233,82,70}			          % headers and hyperlinks
\definecolor{fgDark}{RGB}{91,27,22}             % text color in console (draft mode)
\definecolor{fgDarker}{RGB}{51,8,6}             % background color in console
\definecolor{fgLight}{RGB}{241,167,159}         % table header rows
\definecolor{fgVeryLight}{RGB}{248,226,224}     % table normal rows
\definecolor{fgYellow}{RGB}{250,165,25}
\definecolor{fgText}{RGB}{0,0,0}                % text
\definecolor{bg}{RGB}{255,255,255}              % Background
\definecolor{fg2}{RGB}{0,0,0}				            % 2nd foreground
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
\newcommand{\setHeaders}{					% macro initializing the headers and footers
	\pagestyle{fancy}
	\fancyhf{}
	\chead{\textcolor{fgText}{\MyTitle}}
	\cfoot{\textcolor{fgText}{\thepage\ / \pageref*{LastPage}}}
	\renewcommand\headrule{					% color and thickness of the header rule
    	{\color{fgText}\hrule width \hsize}}
	\renewcommand\footrule{					% color and thickness of the header rule
    	{\color{fgText}\hrule width \hsize} \kern 1mm}
}
% ----------------------

% ----------------------
% DIAGRAM SETTINGS
\RequirePackage{pgf}
\RequirePackage{tikz}						% programmatically defines drawings
\RequirePackage{pgfplots}
%
\pgfplotsset{compat=1.14}                   % supposed to be 1.15 (apparently not installed on Overleaf)
\usetikzlibrary{arrows}						% configures arrow tips
\usetikzlibrary{arrows.meta}				% necessary to draw graphs
\tikzset{>=latex}							% uses larger default arrow tips
\usetikzlibrary{calc}						% extended coordinate calculation
\usetikzlibrary{decorations.markings}		% improved decorations
\usetikzlibrary{math}						% use mathematical functions
\usetikzlibrary{positioning} 				% ease relative positioning
% ----------------------

% ----------------------
% HYPERLINKS SETTINGS
\RequirePackage[
	bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
	unicode=true, colorlinks=true, linktoc=all, %linktoc=page
	linkcolor=fg, citecolor=fg, filecolor=fg, urlcolor=fg,
	pdfstartview=FitH, 
	pdfkeywords={modèle de rapport v4.1},
    pdfencoding=auto                        % avoid encoding problems in PDF bookmarks (French)
]{hyperref}									% enables hyperlinks
\RequirePackage{url}						% properly displays urls
%
% deals with problem in PDF properties
\makeatletter
\pdfstringdefDisableCommands{%
  \def\\{}%
  \def\hbox{}%
  \def\mathsurround{}%
  \def\z@{0}%
  \def\@@underline{}%
  \def\textsuperscript#1{}%
  \def\texttt#1{<#1>}%
}
\makeatother
% check this: <https://tex.stackexchange.com/questions/306988/automatically-add-texorpdfstring-for-math-mode-in-section-titles>
% ----------------------

% ----------------------
% TABLE SETTINGS
\RequirePackage{multirow}						% cells spanning several rows
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}	% thicker line for the tables
\RequirePackage{tabularx} 						% for larger tables
\RequirePackage{array}							% extends table and array functions
% Macro by A. Kassi 							% don't remember what this is for...
% http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
\makeatletter
	\def\hlinewd#1{
	\noalign{\ifnum0=`}\fi\hrule \@height #1
	\futurelet\reserved@a\@xhline}
\makeatother
% end macro
\RequirePackage{csvsimple}						% populates table with file content
% ----------------------

% ----------------------
% MATH SETTINGS
\RequirePackage{amsmath}						% extended mathematical functions
\RequirePackage{amsthm}							% even more advanced math functions
\RequirePackage{amssymb}  						% additional math symbols
%
%\RequirePackage{unicode-math}
%\setmathfont[version=Stix2]{Stix Two Math} % see http://stixfonts.org/
%\mathversion{Stix2}
%\def\mathfamilydefault{\rmdefault}          % but keep the serif font for formulas
%
% Theorems/Definitions ... environments
\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{Yellow}{RGB}{250,250,50}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{ggreen}{RGB}{128,192,0}
\definecolor{dGreen}{RGB}{64,128,0}
\definecolor{orange}{RGB}{255,128,0}
\definecolor{dOrange}{RGB}{128,64,0}
\definecolor{purple}{RGB}{200,0,128}
\definecolor{dPurple}{RGB}{128,0,128}
\definecolor{rred}{RGB}{200,0,0}
\definecolor{dRed}{RGB}{128,0,64}
\definecolor{dBlue}{RGB}{0,0,128}
\definecolor{bblue}{RGB}{0,64,128}

\RequirePackage[framemethod=default]{mdframed}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=darkgray,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{exBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=dRed,
%backgroundcolor=darkgray!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt,
innerbottommargin=3pt]{exoBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=dBlue,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{defBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=dPurple,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{remBox}

\newmdenv[skipabove=2pt,
rightline=true,
leftline=true,
topline=true,
bottomline=true,
linewidth=.3pt,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
innerbottommargin=3pt]{BBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=false,
topline=false,
bottomline=false,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{demBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=false,
topline=false,
bottomline=false,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{comBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=dGreen,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{theoBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=dRed,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{propoBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=lightgray,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{lemBox}

\newmdenv[skipabove=2pt,
skipbelow=2pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=Yellow,
backgroundcolor=bg,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=-5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=3pt]{coroBox}


\newtheorem{regT}{Règle}
\newtheorem{critT}{Critère}
\newtheorem{theoT}{Théorème}
\newtheorem{propoT}{Proposition}
\newtheorem{coroT}{Corollaire}
\newtheorem*{coroTe}{Corollaire}

\newtheoremstyle{lemme}{3pt}{3pt}{\itshape}{}{\itshape}{.}{.5em}{}
\theoremstyle{lemme}
\newtheorem{lemT}{Lemme}

\theoremstyle{definition}
\newtheorem*{exT}{Exemple}
\newtheorem*{exTs}{Exemples}
\newtheorem{defT}{Définition}
\newtheorem*{defT*}{Définition}
\newtheorem*{defTs}{Définitions}
\newtheorem*{demT}{Démonstration}
\newtheorem*{demTs}{Démonstrations}
\newtheorem*{exoT}{Exercice}
\newtheorem*{exoTs}{Exercices}
\newtheorem*{comT}{Commentaire}

\theoremstyle{remark}
\newtheorem*{remT}{Remarque}
\newtheorem*{remTs}{Remarques}

\newcounter{exer}
\newenvironment{ex}{\begin{exBox}\begin{exT}}{\end{exT}\end{exBox}}
\newenvironment{exs}{\begin{exBox}\begin{exTs}\hfill\begin{enumerate}[label=\arabic*.]}{\end{enumerate}\end{exTs}\end{exBox}}

\newenvironment{exo}{\begin{exoBox}\begin{exoT}}{\end{exoT}\end{exoBox}}
\newenvironment{exos}[1]{
\begin{exoBox}
  \begin{exoTs}
    #1\hfill
    \begin{list}{\arabic{exer}) }{
      \usecounter{exer}
      \setlength{\labelsep}{2pt}
      \setlength{\leftmargin}{0pt}%
      \setlength{\labelwidth}{0pt}%
      \setlength{\listparindent}{0pt}}}
    {\end{list}
  \end{exoTs}
\end{exoBox}}

\newenvironment{defin}{\begin{defBox}\begin{defT}}{\end{defT}\end{defBox}}
\newenvironment{defin*}{\begin{defBox}\begin{defT*}}{\end{defT*}\end{defBox}}
\newenvironment{defins}{\begin{defBox}\begin{defTs}\hfill\begin{itemize}}{\end{itemize}\end{defTs}\end{defBox}}

%\newenvironment{rem}{\begin{remBox}\begin{remT}}{\end{remT}\end{remBox}}
%\newenvironment{rems}{\begin{remBox}\begin{remTs}\hfill\begin{itemize}}{\end{itemize}\end{remTs}\end{remBox}}

\newenvironment{demo}{\begin{demBox}\begin{proof}}{\end{proof}\end{demBox}}
\newenvironment{demos}{\begin{demBox}\begin{demTs}\hfill}{\end{demTs}\end{demBox}}

\newenvironment{com}{\begin{comBox}\begin{comT}}{\end{comT}\end{comBox}}

\newenvironment{bbox}{\begin{BBox}}{\end{BBox}}
\newenvironment{reg}{\begin{BBox}\begin{regT}}{\end{regT}\end{BBox}}

\newenvironment{cs}[1]{\begin{BBox}\hfill\begin{enumerate}[label=\textbf{CS\arabic*.}, start=#1, leftmargin=1cm]}{\end{enumerate}\end{BBox}}
\newenvironment{cf}[1]{\begin{BBox}\hfill\begin{enumerate}[label=\textbf{CF\arabic*.}, start=#1, leftmargin=1cm]}{\end{enumerate}\end{BBox}}
\newenvironment{cd}[1]{\begin{BBox}\hfill\begin{enumerate}[label={C\arabic*.}, start=#1, leftmargin=1cm]}{\end{enumerate}\end{BBox}}

\newenvironment{theo}{\begin{theoBox}\begin{theoT}}{\end{theoT}\end{theoBox}}
\newenvironment{propo}{\begin{propoBox}\begin{propoT}}{\end{propoT}\end{propoBox}}
\newenvironment{lem}{\begin{lemBox}\begin{lemT}}{\end{lemT}\end{lemBox}}
\newenvironment{coro}{\begin{coroBox}\begin{coroT}}{\end{coroT}\end{coroBox}}
\newenvironment{coro*}{\begin{coroBox}\begin{coroTe}}{\end{coroTe}\end{coroBox}}

% custom remark frames
\makeatletter
\newenvironment{beware}[1][\@nil]
{	\def\tmp{#1}%
    \setlength{\OuterFrameSep}{0pt}						% no space around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
	\definecolor{shadecolor}{rgb}{1.00,0.80,0.80}		% background color for remarks
	\begin{leftbar}\noindent{}%                         % test for option or not
	\ifx\tmp\@nnil{}\else{\textbf{#1 : }}\fi}           % taken from https://tex.stackexchange.com/questions/217757/special-behavior-if-optional-argument-is-not-passed
{\end{leftbar}\par}
\makeatother

\newenvironment{rem}{\begin{beware}[Remarque]}{\end{beware}}

% see the mdframed package for more control, if needed
% https://ctan.crest.fr/tex-archive/macros/latex/contrib/mdframed/mdframed.pdf

\newcommand{\sqdiamond}[1][fill=black]{\tikz [x=1.2ex,y=1.85ex,line width=.1ex,line join=round, yshift=-0.285ex] \draw  [#1]  (0,.5) -- (.5,1) -- (1,.5) -- (.5,0) -- (0,.5) -- cycle;}%

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
\makeatother % Makes Capital letters in Roman as default in formulas
% Useful commands
\newcommand{\R}{\mathbf{R}}
\renewcommand{\C}{\mathbf{C}}
\newcommand{\Q}{\mathbf{Q}}
\newcommand{\Z}{\mathbf{Z}}
\newcommand{\N}{\mathbf{N}}
%
\newcommand{\mi}[1]{\mathnormal{#1}} % Render in italic letters (roman is default)
% ----------------------

% ----------------------
% BIBLIOGRAPHIC SETTINGS
\RequirePackage{doi}					% displays DOIs in the bibliography
\RequirePackage[autostyle]{csquotes}	% don't remember why I put this
\RequirePackage[
	maxcitenames=2,						% two authors max in the text (only for author-year)
	maxbibnames=99,						% list all authors in the reference list
	style=numeric,						% numeric style for reference list
	citestyle=numeric-comp,				% numeric style for citations
%	style=authoryear,					% NOTE: if you want the author-year style instead,
%	citestyle=authoryear-comp,			% uncomment these 2 lines and comment both ones above
%	backref=true,						% includes a page backlink in the reference list
%	dashed=false,						% displays all author names (only for authoryear)
    datamodel=ceri/sty/hal_id,              % prints custom hal-id fields
    backend=biber                       % uses biber to compile (instead of bibtex)
]
{biblatex}								% uses biblatex (instead of bibtex)
%
\newcommand{\bibName}{Bibliographie}	            % define bibliography header
\AtEveryCite{\restorecommand\mkbibnamefamily}	    % avoid small caps in citations (French)
\setlength\bibitemsep{0.9\itemsep}			        % reduce space between bibliographic items
% command to insert the bibliography
	\newcommand{\MyBibliography}{					% receives the bibtex file
		\newpage
		\phantomsection
		\addcontentsline{toc}{section}{\bibName}	% add the bibliography in the TOC
		{	\setstretch{0.8}
       		\printbibliography
		}
		\thispagestyle{fancy}						% force header/footer
	}
% specific commands for HAL ids
\DeclareFieldFormat{hal}{%
    \ifhyperref
    {$\langle$\href{https://hal.archives-ouvertes.fr/#1}{\nolinkurl{#1}}$\rangle$}
    {$\langle$\nolinkurl{#1}$rlangle$}
}
\DeclareFieldAlias{eprint:hal}{hal}
\DeclareFieldAlias{eprint:HAL}{eprint:hal}
\renewbibmacro*{eprint}{%
    \printfield{hal}%
    \newunit\newblock
    \iffieldundef{eprinttype}
    {\printfield{eprint}}
    {\printfield[eprint:\strfield{eprinttype}]{eprint}}
}
% ----------------------

% ----------------------
% CAPTION SETTINGS
\RequirePackage{caption}					% caption customization
\captionsetup{
	labelfont={color=fg, bf, small},	% font(sf), color, bold, size of the caption label
	textfont={small},						% font(sf) and size of the caption text itself
	labelsep=period,						% separator between label and text
	margin=10mm								% left/right margins
}
\DeclareCaptionType{fileText}[Fichier][Liste de fichiers]
\DeclareCaptionType{consoleText}[Console][Liste de sorties console]
% ----------------------

% ----------------------
% CUSTOM FLOATS
\makeatletter								% change equation numbers
\def\tagform@#1{\maketag@@@{(\color{fg}\textbf{#1}\normalcolor)\@@italiccorr}}
\makeatother
% ----------------------

% ----------------------
% CUSTOM ALGORITHMS
\RequirePackage[							% environment for pseudo code
    french,									% language in the caption (default: English)
    ruled,									% boxed, ruled (shaded in v5.3)
    linesnumbered,							% add line numbers
    longend,								% block-specific end keyword
    procnumbered							% functions/procedures must be numbered
]{algorithm2e}						     	% Overleaf does not have the latest version installed
\SetAlCapFnt{\color{fg}}			    	% change caption font (in algorithm floats)
\SetProcFnt{\color{fg}}					    % change caption font (in function/procedure floats)
% keep the caption below 
% (see https://tex.stackexchange.com/questions/27671/algorithm2e-with-ruled-but-with-caption-underneath)
% and also shaded background
% (see https://tex.stackexchange.com/questions/375669/apply-background-color-in-algorithm2e-but-not-on-the-caption)
\makeatletter                       
\newenvironment{algorithm2e}[1][htpb]
{   \def\@algocf@pre@ruled{%
        \setlength{\OuterFrameSep}{0pt}
	    \setlength{\FrameSep}{1mm}
    	\colorlet{shadecolor}{bgLightGray}
        \begin{shaded}}%
    \def\@algocf@post@ruled{\end{shaded}\relax}%   % without horizontal separator
%    \def\@algocf@post@ruled{\end{shaded}\kern\interspacealgoruled\hrule  height\algoheightrule\kern3pt\relax}%           	% with horizontal separator
    \def\@algocf@capt@ruled{under}%
    \begin{algorithm}[#1]}
  {\end{algorithm}}
\makeatother
\setlength\algotitleheightrule{0pt} 		% remove the last rule (below the caption)
\newcommand{\mycaptfrmt}[1]{\parbox{\linewidth}{\centerline{#1}}}
%\SetAlgoCaptionLayout{mycaptfrmt}   		% center the caption (see open TODO task) >> see https://tex.stackexchange.com/questions/173776/algorithm2e-and-hanging-captions
\SetAlgoCaptionSeparator{\unskip.}          % use dot as the separator in captions
% ----------------------

% ----------------------
% BULLET LISTS
\renewcommand{\FrenchLabelItem}{\textbullet}	% use bullets even in French
\RequirePackage{enumitem}						% gives more control over lists
\setlist{nolistsep}
% ----------------------

% ----------------------
% MACROS FOR DETAILS
\def\major#1{\gdef\MyMajor{#1}}						% name of the class (ex. Licence or Master in CS)
\def\specialization#1{\gdef\MySpecialization{#1}}	% specialization (ex. software engineering vs. computer networks)
\def\course#1{\gdef\MyCourse{#1}}					% class name (Programming, Operating Systems...)
\def\subcourse#1{\gdef\MySubcourse{#1}}				% subclass name (optional)
\newcommand{\advisor}[2][Encadrement]{%             % teacher advising the students (for an internship report, optional)
    \gdef\MyAdvisor{#2}
    \gdef\MyAdvisorTitle{#1}
}

\def\group#1{\gdef\MyGroup{#1}}						% student group (for a project report)
\def\date#1{\gdef\MyDate{#1}}						% date (optional)
\def\summary#1{\gdef\MySummary{#1}}					% abstract (for a paper)
% ----------------------

% ----------------------
% CUSTOM SECTION HEADERS
\RequirePackage{titlesec}
\titleformat{\chapter}
	{\color{fg2}\normalfont\Huge\bfseries\scshape}
    {\thechapter}
    {1em}
    {}
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

\newcommand{\chapimage}[1]{
	\newgeometry{top=0cm}
	\begin{center}
  		\makebox[\textwidth]{\includegraphics[width=\paperwidth, height=5cm]{#1}}
  	\end{center}
  	\restoregeometry
  	\begin{tikzpicture}[remember picture, overlay]
        \draw[fill=fg2] (0,5cm) rectangle
          (\paperwidth,6.5cm);
    \end{tikzpicture}
}

%\setcounter{secnumdepth}{5}			% number subsubsections
%\setcounter{tocdepth}{5}				% and include them in the TOC
\setcounter{secnumdepth}{3}				% number subsubsections
\setcounter{tocdepth}{3}				% and include them in the TOC
% NOTE: only (?) for the report class
%	\RequirePackage{chngcntr}			% defines specific counters
%	\counterwithout{section}{chapter}	% hide the chapter number in section headings
% ----------------------

% ----------------------
% CUSTOM LISTINGS
\RequirePackage{listings}						% format source code
% \RequirePackage{lstlinebgrd}					% change background color - does not work anymore (v3.8.14)
\definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
\definecolor{colComments}{RGB}{77,109,141}		% comment color
\definecolor{colStrings} {RGB}{42,0,255}		% string literal color
\definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
\definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
%\definecolor{mauve}{rgb}{0.58,0.00,0.82}
\lstset{
%	frame=tb,									% frame around the source code
	aboveskip=1mm,								% space before the source code
	belowskip=1mm,								% space after the source code
	showstringspaces=false,						% display space char as underscore
	columns=flexible,
    captionpos=b,                               % position of the caption (t or b)
	basicstyle={\small\ttfamily\NoAutoSpacing},
	keywordstyle=\color{colKeywords},			% set keyword color
	commentstyle=\color{colComments},			% set comment color
	stringstyle=\color{colStrings},				% set string literal color
    backgroundcolor=\color{bgLightGray},		% set background color
	numbers=left,								% line numbering: left, none
	numberstyle=\tiny\color{colNumber},			% line number format
	breaklines=true,							
	breakatwhitespace=true,						
	tabsize=3,									% size of tabulation (in chars)
	upquote=true,                               % straight quote character (' instead of ’)
    literate=%
		{à}{{\`a}}1
        {À}{{\`A}}1
        {á}{{\'a}}1
        {Á}{{\'A}}1
		{â}{{\^a}}1
        {Â}{{\^A}}1
        {ä}{{\"a}}1
        {Ä}{{\"A}}1
        {å}{{\r a}}1
        {Å}{{\r A}}1
        {æ}{{\ae}}1
        {Æ}{{\AE}}1
		{ç}{{\c{c}}}1
        {Ç}{{\c{C}}}1
		{é}{{\'e}}1
        {É}{{\'E}}1
		{è}{{\`e}}1
        {È}{{\`E}}1
		{ë}{{\"e}}1
        {Ë}{{\"E}}1
		{ê}{{\^e}}1
        {Ê}{{\^E}}1
        {í}{{\'i}}1
        {Í}{{\'I}}1
        {ì}{{\`i}}1
        {Ì}{{\`I}}1
		{ï}{{\"i}}1
        {Ï}{{\"I}}1
		{î}{{\^i}}1
        {Î}{{\^I}}1
        {ñ}{{\~n}}1
        {Ñ}{{\~N}}1
        {ó}{{\'o}}1
        {Ó}{{\'O}}1
        {ò}{{\`o}}1
        {Ò}{{\`O}}1
		{ö}{{\"o}}1
        {Ö}{{\"O}}1
		{ô}{{\^o}}1
        {Ö}{{\^O}}1
        {ő}{{\H{o}}}1
        {Ő}{{\H{O}}}1
        {ø}{{\o}}1
        {œ}{{\oe}}1
        {Œ}{{\OE}}1
        {ß}{{\ss}}1
        {ú}{{\'u}}1
        {Ú}{{\'U}}1
		{ù}{{\`u}}1
        {Ù}{{\`U}}1
		{ü}{{\"u}}1
        {Ü}{{\"U}}1
		{û}{{\^u}}1
        {Û}{{\^U}}1
        {ű}{{\H{u}}}1
        {Ű}{{\H{U}}}1
        {€}{{\euro}}1 
        {£}{{\pounds}}1 
        {«}{{\guillemotleft}}1
        {»}{{\guillemotright}}1 
        {¿}{{?`}}1
}
% this is just to be able to mention the listings environments... in latex listings environments
\lstnewenvironment{TeXlstlisting}{\lstset{language=[LaTeX]TeX,numbers=none}}{}
% ----------------------

% ----------------------
% TYPEWRITER-TYPE ENVIRONMENTS
\RequirePackage{framed}
\pgfkeys{
 /filetext/.is family, /filetext,
 caption/.estore in = \filetextCaption,
 label/.estore in = \filetextLabel,
}
\makeatletter
\newenvironment{filetext}[1][]
{	\def\tmp{#1}%
    \pgfkeys{/filetext,#1}
    \setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
    \colorlet{shadecolor}{fgVeryLight}               % background color to display files
	\begin{shaded}\begin{raggedright}\captionsetup{type=fileText}\small\ttfamily}
{\end{raggedright}\end{shaded}\par%
%\ifx\tmp\@nnil{\relax}\else{\vspace{-0.25cm}\captionof{fileText}{\filetextCaption}\vspace{0.25cm}\label{\filetextLabel}}\fi
\ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{fileText}{\filetextCaption}\vspace{0.25cm}\label{\filetextLabel}}
    
}
\makeatother
\pgfkeys{
 /consoletext/.is family, /consoletext,
 caption/.estore in = \consoletextCaption,
 label/.estore in = \consoletextLabel,
}
\makeatletter
\newenvironment{consoletext}[1][]
{	\def\tmp{#1}%
    \pgfkeys{/consoletext,#1}
    \setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
    \colorlet{shadecolor}{fgDarker}                % background color to display console
	\begin{shaded}\begin{raggedright}\captionsetup{type=consoleText}\small\ttfamily\color{fgVeryLight}}
{\end{raggedright}\end{shaded}\par%
%\ifx\tmp\@nnil{\relax}\else{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}\fi
\ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}
}
\makeatother
\RequirePackage{textcomp}                               % for the \textquotesingle command (straight single quotes in \texttt)
% ----------------------

% ----------------------
% GANTT DIAGRAMS (Optional)
% the below part is taken from StackExchange:
	% http://tex.stackexchange.com/questions/175830/how-to-draw-a-vertical-line-at-a-specified-date-in-a-gantt-chart
%	\RequirePackage{pgfgantt}		% load the package we are modifying
%    \makeatletter
%	\@gtt@keydef{anyday}{none}		% some new keys for the style of our "anyday" marker lines
%	\@gtt@keydef{anyday offset}{1}
%	\@gtt@stylekeydef{anyday rule}{dashed, line width=1pt}
%	\@gtt@keydef{anyday label font}{\normalfont}
%	\@gtt@stylekeydef{anyday label node}{%
%  		anchor=north, font=\ganttvalueof{anyday label font}%
%	}
%	\newcount\gtt@anyday@slot
%	\newcommand\drawverticalline[2]{%
%  		\gtt@tsstojulian{#1}{\gtt@anyday@slot}%
%  		\gtt@juliantotimeslot{\gtt@anyday@slot}{\gtt@anyday@slot}%
%  		\pgfmathsetmacro\y@upper{%
%    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
%  		}%
%  		\pgfmathsetmacro\y@lower{%
%    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
%      		+ (\gtt@currentline - \gtt@lasttitleline - 1)%
%      		* \ganttvalueof{y unit chart}%
%  		}%
%  		\pgfmathsetmacro\x@mid{%
%    		(\gtt@anyday@slot - 1 + \ganttvalueof{anyday offset})%
%      		* \ganttvalueof{x unit}%
%  		}%
%  		\draw [/pgfgantt/anyday rule]
%    		(\x@mid pt, \y@upper pt) -- (\x@mid pt, \y@lower pt)
%    		node [/pgfgantt/anyday label node] {#2};%
%	}
%    \makeatother
% custom bars
%\newcommand\ganttbarbis[5]{\ganttbar{#1}{#3}{#4}\ganttbar[inline, bar/.append style={fill=#5}, bar label font=\footnotesize]{#2}{#3}{#4}}
% custom week numbers
%\newcounter{myWeekNum}
%\stepcounter{myWeekNum}
%\newcommand{\myWeek}{\themyWeekNum
%	\stepcounter{myWeekNum}
%	\ifnum\themyWeekNum=53
%		\setcounter{myWeekNum}{1}
%	\else\fi
%}
%\ganttset{%
%calendar week text={s\myWeek{}}%
%}
% ----------------------

% ----------------------
% NAMES OF SPECIALIZED TABLES OF CONTENT
\newcommand{\tocName}{Sommaire}									% define TOC header
\addto\captionsfrench{\renewcommand{\contentsname}{\tocName}}	% change TOC header
\newcommand{\lofName}{Liste des figures}						% define LOF header
%\renewcommand{\listfigurename}{\lofName}						% change LOF header (1)
\addto\captionsfrench{\renewcommand{\listfigurename}{\lofName}}	% change LOF header (2)
\newcommand{\lotName}{Liste des tables}							% define LOT header
%\renewcommand{\listtablename}{\lotName}						% change LOT header (1)
\addto\captionsfrench{\renewcommand{\listtablename}{\lotName}}	% change LOT header (2)
% ----------------------

% ----------------------
% SPECIALIZED TABLES OF CONTENT
\newcommand{\MyToc}{
	\phantomsection
	\addcontentsline{toc}{section}{\tocName}	% add the TOC in the TOC (yes! for PDF bookmarks)
	\tableofcontents							% insert TOC
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLof}{
	\phantomsection
	\addcontentsline{toc}{section}{\lofName}	% add the LOF in the TOC
	\listoffigures								% insert LOF
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLot}{
	\phantomsection
	\addcontentsline{toc}{section}{\lotName}	% add the LOT in the TOC
	\listoftables								% insert LOT
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
% ----------------------

% ----------------------
% REGULAR TITLE PAGE
\newcommand{\maketitleZ}{
	% setup PDF doc info
	\hypersetup{
    	pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	   	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    	pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
	}
	
	% custom headers and footers
	\setHeaders
    
	% draw title page
	\phantomsection 
	\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmarks)
	\usetikzlibrary{shapes.geometric}
	\usetikzlibrary{calc}
	%\RequirePackage{anyfontsize}
	\pagestyle{empty}

    \begin{titlepage}
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
    		\node[left,fg!5,minimum width=0.625*\paperwidth,minimum height=3cm, rounded corners] at ($(current page.north east)+(0,-9.5)$){{\fontsize{25}{30} \selectfont \bfseries \MyTitle}};
    		% Subtitle 
    		\node[left,fg!10,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-11)$){{\huge \textit{\MyCourse}}};
    		% Author Name
    		\node[left,fg!5,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-13)$){{\Large \textsc{\MyAuthor}}};
    		% Year
    		\node[rounded corners,fill=fg!95,text =fg!5,regular polygon,regular polygon sides=6, minimum size=2.5 cm,inner sep=0,ultra thick] at ($(current page.west)+(2.5,-5)$) {\LARGE \bfseries \MyDate};
    	\end{tikzpicture}
    \end{titlepage}
	
	\pagecolor{bg}
	\setcounter{page}{2} 	% set the second page... to number 2
	\thispagestyle{fancy}	% force header/footer
	\newpage
		
	% insert abstract
	\ifdefined\MySummary
		\phantomsection
		\addcontentsline{toc}{section}{\abstractname}	% add the abstract in the 
		\noindent \textcolor{fg}{\textbf{\huge \abstractname}}
           
		\vspace{0.25cm}
		\MySummary
		\newpage
	\else\fi
        
	% insert ToC
	\MyToc
}
\renewcommand{\maketitle}{\maketitleZ}
% ----------------------

% ---------------------- OPTIONS ----------------------
% ----------------------
% HANDLES THE "light" OPTION
\DeclareOption{light}{%
	\SetWatermarkText{BROUILLON}

	\renewcommand{\maketitle}{
		% setup PDF doc info
		\hypersetup{
    		pdftitle={\ifdefined\MyTitle \MyTitle \else \fi},
	    	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    		pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
		}
			
		% custom headers and footers
		\pagestyle{fancy}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\renewcommand{\footrulewidth}{0.4pt}
		\cfoot{\thepage\ / \pageref*{LastPage}} 
		\chead{\MyTitle} 

		% first page style
		\fancypagestyle{firststyle}
		{	\fancyhf{}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0.4pt}
			\cfoot{\thepage\ / \pageref*{LastPage}} 
		}
			
		% draw title page
		\phantomsection 
		\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
		\begin{center}
           	% title
			\Huge{\textbf{\textcolor{fg2}{\MyTitle}}} \\
			% authors
			\Large{\MyAuthor} \\
			% group
			\vspace{0.2cm}
			\ifdefined\MyGroup 
				\normalsize{\MyGroup} \\
			\else\fi
			% date
			\ifdefined\MyDate
				\ifdefempty{\MyDate}{\small{\today} \\}{\small{\MyDate} \\}
			\else
				{\small{\today}} \\
			\fi
			% major and specialization
            \ifdefined\MyMajor
    			\vspace{0.2cm}
				\normalsize{\textbf{\MyMajor}}
				\ifdefined\MySpecialization
					\normalsize{ -- }
				\else
					\\
				\fi
			\else\fi
			\ifdefined\MySpecialization
            	\normalsize{\textbf{\MySpecialization}} \\
            \else\fi
			% course
			\ifdefined\MyCourse
    			\vspace{0.2cm}
				\normalsize{\textbf{UE} \MyCourse} \\
			\else\fi
			% subcourse
			\ifdefined\MySubcourse
				\normalsize{\textbf{UCE} \MySubcourse} \\
			\else\fi
			% advisor
			\ifdefined\MyAdvisor
    			\vspace{0.2cm}
				{\small{\textbf{\MyAdvisorTitle :} \\ \MyAdvisor}} \\
			\else\fi
            % abstract
            \ifdefined\MySummary
            	\phantomsection
                \addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
                \parbox[c][][s]{0.75\textwidth}{\footnotesize \vspace{0.5cm} \noindent \textcolor{fg}{\textbf{\abstractname.}} \MySummary}
			\else\fi
		\end{center}	
	
		\setcounter{page}{1} 		% set the second page... to number 2
		\thispagestyle{firststyle}	% force header/footer
	}
}
% ----------------------

% ----------------------
% HANDLES THE "full" OPTION
\DeclareOption{full}{%
	\renewcommand{\maketitle}
	{	\maketitleZ
    	% Insert list of figures
		\MyLof
		% Insert list of tables
		\MyLot
	}
}
% ----------------------

% ----------------------
% HANDLES THE "handout" OPTION
\DeclareOption{handout}                         % console text in video inverse
{   \makeatletter
    \renewenvironment{consoletext}[1][]         % redefine the previously defined environment
    {	\def\tmp{#1}%
        \pgfkeys{/consoletext,#1}
        \setlength{\OuterFrameSep}{0pt}		    % frame around the text
	    \setlength{\FrameSep}{1mm}			    % just a bit of colored space around the text
	    \colorlet{shadecolor}{fgVeryLight}   % background color to display console
	    \begin{framed}\begin{raggedright}\captionsetup{type=consoleText}\small\ttfamily\color{fgDark}}
    {\end{raggedright}\end{framed}\par
        \ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}
    }
    \makeatother
}
% ----------------------

% ----------------------
% COLOR OPTIONS
\DeclareOption{cold}{ 
    \definecolor{fg}{RGB}{112,121,140}			       % headers and hyperlinks
    \definecolor{fgDark}{RGB}{91,27,22}         	   % text color in console (draft mode)
    \definecolor{fgDarker}{RGB}{51,8,6}                % background color in console
    \definecolor{fgLight}{RGB}{164,170,182}   	       % table header rows
    \definecolor{fgVeryLight}{RGB}{221,223,228}        % table normal rows
    \definecolor{fgText}{RGB}{37,35,35}                % Text
    \definecolor{bg}{RGB}{245,241,237}                 % Background
    \definecolor{fg2}{RGB}{218,210,188}
    %\definecolor{fgYellow}{RGB}{250,165,25}
    %\definecolor{fgDeep}{RGB}{238,42,36}
    %\definecolor{fgLightYellow}{RGB}{229,208,66}
    \definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background

    \definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
    \definecolor{colComments}{RGB}{77,109,141}		% comment color
    \definecolor{colStrings} {RGB}{42,0,255}		% string literal color
    \definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
    \definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
}
\DeclareOption{red}{ 
    \definecolor{fg}{RGB}{239,35,60}			       % headers and hyperlinks
    \definecolor{fgLight}{RGB}{242,84,103}   	       % table header rows
    \definecolor{fgVeryLight}{RGB}{248,160,170}        % table normal rows

    \definecolor{fgText}{RGB}{43,45,66}                % Text
    \definecolor{bg}{RGB}{237,242,244}                 % Background
    \definecolor{fg2}{RGB}{141,153,174}

    \definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
    \definecolor{fgDark}{RGB}{91,27,22}         	   % text color in console (draft mode)
    \definecolor{fgDarker}{RGB}{51,8,6}                % background color in console
    \definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
    \definecolor{colComments}{RGB}{77,109,141}		% comment color
    \definecolor{colStrings} {RGB}{42,0,255}		% string literal color
    \definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
    \definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
}
\DeclareOption{berry}{ 
    \definecolor{fg}{RGB}{242,84,91}			       % headers and hyperlinks
    \definecolor{fgLight}{RGB}{248,160,165}   	       % table header rows
    \definecolor{fgVeryLight}{RGB}{252,217,219}        % table normal rows

    \definecolor{fgText}{RGB}{25,50,60}                % Text
    \definecolor{bg}{RGB}{243,247,240}                 % Background
    \definecolor{fg2}{RGB}{169,63,85}

    \definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
    \definecolor{fgDark}{RGB}{91,27,22}         	   % text color in console (draft mode)
    \definecolor{fgDarker}{RGB}{51,8,6}                % background color in console
    \definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
    \definecolor{colComments}{RGB}{77,109,141}		% comment color
    \definecolor{colStrings} {RGB}{42,0,255}		% string literal color
    \definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
    \definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
}
\DeclareOption{ireland}{ 
    \definecolor{fg}{RGB}{30,168,150}			       % headers and hyperlinks
    \definecolor{fgLight}{RGB}{151,237,225}   	       % table header rows
    \definecolor{fgVeryLight}{RGB}{203,246,240}        % table normal rows

    \definecolor{fgText}{RGB}{78,64,84}                % Text
    \definecolor{bg}{RGB}{255,255,255}                 % Background
    \definecolor{fg2}{RGB}{255,113,91}

    \definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
    \definecolor{fgDark}{RGB}{91,27,22}         	   % text color in console (draft mode)
    \definecolor{fgDarker}{RGB}{51,8,6}                % background color in console
    \definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
    \definecolor{colComments}{RGB}{77,109,141}		% comment color
    \definecolor{colStrings} {RGB}{42,0,255}		% string literal color
    \definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
    \definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
}
\DeclareOption{scand}{ 
    \definecolor{fg}{RGB}{56,95,113}			       % headers and hyperlinks
    \definecolor{fgLight}{RGB}{159,193,208}   	       % table header rows
    \definecolor{fgVeryLight}{RGB}{200,218,228}        % table normal rows

    \definecolor{fgText}{RGB}{43,65,98}                % Text
    \definecolor{bg}{RGB}{245,240,246}                 % Background
    \definecolor{fg2}{RGB}{215,179,119}

    \definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
    \definecolor{fgDark}{RGB}{91,27,22}         	   % text color in console (draft mode)
    \definecolor{fgDarker}{RGB}{51,8,6}                % background color in console
    \definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
    \definecolor{colComments}{RGB}{77,109,141}		% comment color
    \definecolor{colStrings} {RGB}{42,0,255}		% string literal color
    \definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
    \definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
}
% ----------------------

\ProcessOptions
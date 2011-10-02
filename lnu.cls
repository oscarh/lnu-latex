\ProvidesClass{lnu}[2011/10/01 Document class for LNU report]

\DeclareOption{utf8}{\PassOptionsToPackage{utf8}{inputenc}}
\DeclareOption{latin1}{\PassOptionsToPackage{latin1}{inputenc}}
\DeclareOption{english}{\PassOptionsToPackage{english}{babel}}
\DeclareOption{swedish}{\PassOptionsToPackage{swedish}{babel}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass{article}

\RequirePackage[latin1,utf8]{inputenc}
\RequirePackage[lmargin=4cm,rmargin=5cm,tmargin=3cm,bmargin=3cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[english]{babel}
\RequirePackage{ifthen}
\RequirePackage{changepage}

\pagenumbering{arabic}
\graphicspath{{inc/}}

\def\lnu@institution{}
\def\lnu@course{}
\def\lnu@points{}
\def\lnu@subcourse{}
\def\lnu@module{}
\def\lnu@contactteacher{}

\newcommand{\institution}[1]{\def\lnu@institution{#1}}
\newcommand{\course}[1]{\def\lnu@course{#1}}
\newcommand{\points}[1]{\def\lnu@points{#1}}
\newcommand{\subcourse}[1]{\def\lnu@subcourse{#1}}
\newcommand{\module}[1]{\def\lnu@module{#1}}
\newcommand{\contactteacher}[1]{\def\lnu@contactteacher{#1}}

\IfFileExists{inc/lnu_symbol.pdf}{}{
	\ClassError{lnu_symbol}%
	{Please make sure that lnu_symbol.pdf exists in your inc directory.}
}

\IfFileExists{inc/lnu_sublogo.pdf}{}{
	\ClassError{lnu_sublogo}%
	{Please make sure that lnu_sublogo.pdf exists in your inc directory.}
}

\AtBeginDocument{
	\ifthenelse{\equal{\lnu@institution}{}}{%
		\ClassWarning{institution}{No institution set}}{}
	\ifthenelse{\equal{\lnu@course}{}}{%
		\ClassWarning{course}{No course set}}{}
	\ifthenelse{\equal{\lnu@points}{}}{%
		\ClassWarning{points}{No points set}}{}
	\ifthenelse{\equal{\lnu@module}{}}{%
		\ClassWarning{module}{No module set}}{}
	\ifthenelse{\equal{\lnu@subcourse}{}}{%
		\ClassWarning{subcourse}{No sub course teacher set}}{}
	\ifthenelse{\equal{\lnu@contactteacher}{}}{%
		\ClassWarning{contactteacher}{No contact teacher set}}{}
}

\renewcommand{\maketitle}{%
	\begin{adjustwidth}{-3cm}{-4cm}
	\begin{tabular*}{1.0\linewidth}{ l | l }
	\includegraphics[width=1.0cm]{lnu_symbol.pdf}\hspace{1.5cm} & \includegraphics{lnu_sublogo.pdf}\\*
	& \\*
	                                              &	\lnu@institution\\*
	                                              & {\lnu@course} {\lnu@points}hp Modul \lnu@module\\*
	                                              & \lnu@subcourse\\*
	                                              & Kontaktl\"{a}rare: \lnu@contactteacher\\*
	                                              & Student: \@author\\*
	\end{tabular*}
	\end{adjustwidth}
	\vspace{1.5cm}
}

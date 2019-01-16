% handout.cls --- LaTeX class for handouts
% written by Stefan Harmeling (sth2000@gmx.net), 2014
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{handout}[2014/10/10 LaTeX class for handouts]

% extend 'article.cls'
\LoadClass[12pt]{article}
% make the area for text wider
\RequirePackage[a4paper,top=20mm,bottom=20mm,left=20mm,right=20mm]{geometry}
\frenchspacing
%\parskip2ex
\parindent0ex
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{nicefrac}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{graphicx}
\RequirePackage{hyperref}  %%%% HOW DOES THIS WORK WITH file:///... ???

% tikz and some configuration
\RequirePackage{tikz}
\tikzstyle{graphnode} = 
   [circle,draw=black,minimum size=22pt,text centered,text
     width=22pt,inner sep=0pt] 
\tikzstyle{var}   =[graphnode,fill=white]
\tikzstyle{obs}   =[graphnode,fill=black,text=white]
\tikzstyle{fac}   =[rectangle,draw=black,fill=black!25,minimum size=5pt]
\tikzstyle{facprior} =[rectangle,draw=black,fill=black,text=white,minimum size=5pt]
\tikzstyle{edge}  =[draw=white,double=black,thick,-]
\tikzstyle{prior} =[rectangle, draw=black, fill=black, minimum size=
5pt, inner sep=0pt]
\tikzstyle{dirprior} = [circle, draw=black, fill=black, minimum
size=5pt, inner sep=0pt]


% simplified title
\renewcommand\maketitle{
  \begin{center}
    \bigskip
    \bfseries\@title
    \bigskip
  \end{center}
}

% MACROS
\DeclareMathOperator{\Diag}{Diag}               % diagonal matrix from vector
\DeclareMathOperator{\diag}{diag}               % diagonal of a matrix
\DeclareMathOperator{\ve}{vec}                  % vectorizer of a matrix
\renewcommand{\vec}{\operatorname{vec}}         % (can't use DeclareMathOperator)
\DeclareMathOperator{\tr}{tr}                   % trace of a matrix
\DeclareMathOperator{\argmin}{argmin}           % argument that achieves minimum
\DeclareMathOperator{\argmax}{argmax}           % argument that achieves maximum
\DeclareMathOperator{\Conj}{Conj}               % complex conjugate
\DeclareMathOperator{\GP}{GP}                   % Gaussian process distribution
\DeclareMathOperator{\HSIC}{HSIC}               % Hilbert-Schmidt Information Criterion
\DeclareMathOperator{\E}{E}                     % Expected value
\DeclareMathOperator{\Var}{Var}                 % Variance
\DeclareMathOperator{\Cov}{Cov}                 % Covariance
\DeclareMathOperator{\dft}{\mathcal{F}}         % discrete Fourier transform
\DeclareMathOperator{\idft}{\mathcal{F}^{-1}}   % inverse discrete Fourier transform
\DeclareMathOperator{\reshape}{reshape}
\DeclareMathOperator{\sign}{sign}
\DeclareMathOperator{\DFT}{\mat{\mathsf{DFT}}}
\DeclareMathOperator{\DWT}{\mat{\mathsf{DWT}}}
\DeclareMathOperator{\size}{size}               % size of a vector/matrix/tensor
\DeclareMathOperator{\rect}{rect}               % rectangular function
\DeclareMathOperator{\sinc}{sinc}               % sinc function
\DeclareMathOperator{\expm}{expm}               % sinc function

\newcommand{\mat}[1]{\left[\begin{array}{ccccccccc}#1\end{array}\right]} % matrix macro
\newcommand{\T}{\mathsf{T}}                     % A^\T transposed matrix
\renewcommand{\H}{\mathsf{H}}                   % A^\H hermitian matrix

\newcommand{\N}{\mathbb{N}}                     % natural numbers
\newcommand{\Z}{\mathbb{Z}}                     % integer numbers
\newcommand{\R}{\mathbb{R}}                     % real numbers
%\newcommand{\C}{\mathbb{C}}                     % complex numbers

\newcommand{\conj}[1]{\overline{#1}}            % complex conjugate
\newcommand{\norm}[1]{\lVert{#1}\rVert}
\newcommand{\bignorm}[1]{\bigl\lVert{#1}\bigr\rVert}
\newcommand{\abs}[1]{\lvert{#1}\rvert}
\newcommand{\bigabs}[1]{\bigl\lvert{#1}\bigr\rvert}
\def\ci{\perp\!\!\!\perp}

\newcommand{\points}[1]{\begin{flushright}\vspace{-1\baselineskip}
    \emph{{#1} points}\end{flushright}\vspace{-1\baselineskip}}

\newcommand{\bonus}[1]{\begin{flushright}\vspace{-1\baselineskip}
		\emph{{#1} bonus points}\end{flushright}\vspace{-1\baselineskip}}
%\newcommand{\pointse}[1]{\hfill \emph{{#1} points}}
%\newcommand{\points}[1]{}

\newcommand{\g}{\,|\,} 
\newcommand{\de}{\partial}
\renewcommand{\d}{\:\mathrm{d}} 
\newcommand{\Exp}{\mathbb{E}}
\newcommand{\Ent}{\mathbb{H}}
\renewcommand{\H}{\mathcal{H}}
\newcommand{\K}{\mathcal{K}} 
\newcommand{\KL}{\text{KL}} 
\renewcommand{\Re}{\mathbb{R}}
\newcommand{\Dcal}{\mathcal{D}} 
\newcommand{\var}{\operatorname{var}}
\newcommand{\Trans}{^{\intercal}} 
\newcommand{\rep}{\text{rep}}
\newcommand{\base}{\text{base}} 
\newcommand{\eval}{\text{eval}}
\renewcommand{\=}{\operatorname*{=}}


\newcommand{\q}{\quad}
\newcommand{\qq}{\qquad}
\newcommand{\qqq}{\quad\qquad}
\newcommand{\qqqq}{\qquad\qquad}

\renewcommand{\vec}{\boldsymbol} \newcommand{\fun}[1]{\mathsf{#1}}
\newcommand{\Id}{\vec{I}} 
\newcommand{\II}{\mathbb{I}}

\newcommand{\bm}{\boldsymbol{m}}
\newcommand{\bmu}{\boldsymbol{\mu}}
\newcommand{\bSigma}{\boldsymbol{\Sigma}}
\newcommand{\w}{\vec{w}}
\newcommand{\y}{\vec{y}}
\newcommand{\x}{\vec{x}}
\newcommand{\X}{\mathbb{X}}

\newcommand{\sA}{\boldsymbol{\mathsf{A}}}
\newcommand{\sB}{\boldsymbol{\mathsf{B}}}
\newcommand{\sC}{\boldsymbol{\mathsf{C}}}

\newcommand{\pmin}{p_{\min}}
\newcommand{\dotp}[2]{\langle {#1}, {#2}\rangle}% bracket notation for the dot product
\newcommand{\Xcal}{\mathcal{X}}
\newcommand{\Ycal}{\mathcal{Y}}                 
\newcommand{\Fcal}{\mathcal{F}}                 
\newcommand{\Hcal}{\mathcal{H}}                 
\newcommand{\Lcal}{\mathcal{L}}                 

\newcommand{\Fall}{{\Fcal_\text{all}}}
\newcommand{\fbayes}{{f^*}}
\newcommand{\Remp}{{R_\text{emp}}}
\newcommand{\Ncal}{\mathcal{N}}                 
\newcommand{\Nat}{\mathbb{N}}                 
\DeclareMathOperator{\Bin}{Bin}                 % Binomial distribution
\DeclareMathOperator{\Ber}{Ber}                 % Bernoulli distribution
\DeclareMathOperator{\Mu}{Mu}                   % Multinomial distribution
\DeclareMathOperator{\Cat}{Cat}                 % Multinoulli distribution
\DeclareMathOperator{\Poi}{Poi}                 % Poisson distribution
\DeclareMathOperator{\Beta}{Beta}               % Beta distribution
\DeclareMathOperator{\Dir}{Dir}                 % Dirichlet distribution
\pagestyle{empty}


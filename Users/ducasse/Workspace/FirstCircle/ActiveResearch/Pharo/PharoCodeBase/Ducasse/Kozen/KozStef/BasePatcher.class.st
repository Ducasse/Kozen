"
I'm responsible to expand 

-BASE- into

<base href=""http://sdmeta.gforge.inria.fr/"" />	
	
BasePatcher new 
	streamOf: (FileSystem workingDirectory / 'Books.html');
	linesDo


The following expressions show that there is a different between a string stored inside a method and a stream from file. No idea why.

BasePatcher new 
	contentsOf: (FileSystem workingDirectory / 'Books.html');
	tryingContents  
	
BasePatcher new trying	
"
Class {
	#name : #BasePatcher,
	#superclass : #Object,
	#instVars : [
		'contents',
		'htmlRegex',
		'stream'
	],
	#category : #KozStef
}

{ #category : #'as yet unclassified' }
BasePatcher class >> onPath: aDirectory [

	
]

{ #category : #trying }
BasePatcher >> baseString [
	^ '<base>http://sdmeta.gforge.inria.fr </base>'
]

{ #category : #'setting context' }
BasePatcher >> contentsOf: aFileSystemFile [
	"self new contentsOf: (FileSystem workingDirectory / 'Books.html') "
	contents := aFileSystemFile readStream contents
]

{ #category : #lines }
BasePatcher >> hasBaseVariable: line [
	
	| re |
	re := '.*-BASE-.*' asRegexIgnoringCase.
	^ re matchesPrefix: line.
]

{ #category : #lines }
BasePatcher >> hasEndHead: line [
	
	| re |
	re := '.*</head>.*' asRegexIgnoringCase.
	^ re matchesPrefix: line.
]

{ #category : #'setting context' }
BasePatcher >> htmlFiles [

	^ FileSystem workingDirectory fileNames select: [ :each | htmlRegex matches:  each ]
]

{ #category : #initialization }
BasePatcher >> initialize [

	super initialize.
	htmlRegex := '.*\.html' asRegex.
]

{ #category : #lines }
BasePatcher >> linesDo [

	[stream atEnd] whileFalse: 
		[ | line |
		line := stream upTo: Character cr.
		Transcript show: '.' ; cr. 
		('*-BASE-*' match: line)
			ifTrue: [ Transcript show: '<base>http://sdmeta.gforge.inria.fr</base>';cr ].
		(self hasEndHead: line)
			ifTrue: [ ^self ] 
		 ]
	
]

{ #category : #lines }
BasePatcher >> linesDo2 [

	[stream atEnd] whileFalse: 
		[ | line |
		line := stream upTo: Character cr.
		Transcript show: '.' ; cr. 
		(self hasEndHead: line)
			ifTrue: [ Transcript show: '/H' ; cr. ^ self ]. "base is only in head. so when head is reached skip it for now."
		 (self hasBaseVariable: line)
			ifTrue: [ Transcript show: '<base>http://sdmeta.gforge.inria.fr</base>';cr ].
		 ]
]

{ #category : #trying }
BasePatcher >> sample [


	^ '<?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
   <link rel="stylesheet" href="stef.css"/>
   <head>
-BASE-
      <title>Dr. St&eacute;phane Ducasse</title>
   </head>'
]

{ #category : #trying }
BasePatcher >> sample2 [


	^ '<?xml version="1.0" encoding="ISO-8859-1"?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
   <link rel="stylesheet" href="stef.css"/>
   <head>
-BASE-
      <title>Dr. St&eacute;phane Ducasse</title>
   </head>
   <body>
      <div id="header">
         <div id="headerSiteTitle">St&eacute;phane Ducasse</div>
         <div id="headerPageTitle">Books and Columns</div>
      </div>
	  
      <div xmlns="" id="menu">
		<div id="toc">
             <div id="tocItem"> <a href="index.html">Home</a> </div>
            <div id="tocItem"> <a href="Publications.html">Publications</a> </div>
            <div id="tocItem"> <a href="Books.html">Books and Columns</a> </div>
			<div id="tocItem"> <a href="FreeBooks.html">Free Smalltalk Books</a> </div>
			<div id="tocItem"> <a href="Resources.html">Downloads/Resources</a> </div>
            <div id="tocItem"> <a href="Teaching.html">Lectures</a> </div>
            <div id="tocItem"> <A HREF= "Coordinates.html">Coordinates</A> </div>
         </div>
         <div id="copyright">
				(rev) 20.10.2014<br/>
			</div>
      </div>
	  
      <div id="mainContent">
	   <div xmlns="" id="docbook">
	     <p>Over the years I wrote the following books. I enjoyed it even if this is always more time consuming than what we would like. I also really have lot of fun writing columns because this is a completely different exercises than scientific papers.</p>
  
      <h2> Books</h2>
<table width="95%"  height="174">
    
	<tr>
      <td width="35%"><img src="Books/Reengineering/oorp-cover.jpg" width=150></td>
      <td width="65%">
        <p><a href="http://www.iam.unibe.ch/%7Escg/OORP/index.html">Object-Oriented Reengineering 
          Patterns</a>. S. Demeyer, St&eacute;phane Ducasse, and Oscar Nierstrasz, 
          Morgan Kaufman Publishers, 2002.</p>
        This book presents reengineering patterns: recurring problems and solutions you encounter when
  	  you reengineer large systems. Migration strategies, reverse engineering patterns and reengineering patterns 
  	  are presented.
      </td>
    </tr>
	
	<tr>
	    <td width="35%"><img src="Books/DeepIntoPharo/deepintoPharo.jpg"width=150></td>
	    <td width="65%">
	      <p><a href="http://rmod.lille.inria.fr/pbe2/">Deep into Smalltalk</a>. Alexandre Bergel, Damien Cassou, St&eacute;phane Ducasse, Jannik Laval, Square Bracket Associates, 2013.</p>
	
	     	Deep into Pharo is the second volume of a series of books covering Pharo. Whereas the first volume is intended for newcomers, this second volume covers deeper topics. It is intended for both students and developers. This book is made available under the Creative Commons Attribution-ShareAlike 3.0 license. You can either download the <a href="http://rmod.lille.inria.fr/pbe2/">PDF</a> for free, or you can buy a softcover copy from <a href="http://www.lulu.com/shop/alexandre-bergel-and-damien-cassou-and-stéphane-ducasse-and-jannik-laval/deep-into-pharo/paperback/product-21184147.html">lulu.com</a>. (You can also pay for the PDF download from lulu.com, if you would like to make a contribution to this effort, but you are under no obligation.) The money is given to the <a href="http://association.pharo.org">Pharo association</a>.

	    </td>
	  </tr>
	
	<tr>
	    <td width="35%"><img src="Books/PharoByExample/pbe.jpg"width=150></td>
	    <td width="65%">
	      <p><a href="http://www.pharobyexample.org/">Pharo by Example</a>. Andrew P. Black, St&eacute;phane Ducasse, Oscar Nierstrasz and Damien Pollet.Square Bracket Associates, 2009.</p>
	     
	It is intended for both students and developers, will guide you gently through the Squeak language and environment by means of a series of examples and exercises.	This book is made available under the Creative Commons Attribution-ShareAlike 3.0 license. You can either download the <a href="http://www.pharobyexample.org">PDF</a> for free, or you can buy a softcover copy from <a href="http://www.lulu.com/shop/oscar-nierstrasz-and-stéphane-ducasse-and-damien-pollet-and-andrew-p-black/pharo-by-example/paperback/product-11266407.html">lulu.com</a>. (You can also pay for the PDF download from lulu.com, if you would like to make a contribution to this effort, but you are under no obligation.)
	    </td>
	  </tr>
	
	
	  <tr>
	    <td width="35%"><img src="Books/SBE/sbe.png"width=150></td>
	    <td width="65%">
	      <p><a href="http://www.squeakbyexample.org//">Squeak by Example</a>. Andrew P. Black, St&eacute;phane Ducasse, Oscar Nierstrasz and Damien Pollet.Square Bracket Associates, 2007.</p>
	     
	It is intended for both students and developers, will guide you gently through the Squeak language and environment by means of a series of examples and exercises.	This book is made available under the Creative Commons Attribution-ShareAlike 3.0 license. You can either download the <a href="http://www.squeakbyexample.org">PDF</a> for free, or you can buy a softcover copy from <a href="http://www.lulu.com/content/1171965">lulu.com</a>. (You can also pay for the PDF download from lulu.com, if you would like to make a contribution to this effort, but you are under no obligation.)
	    </td>
	  </tr>
	
	
	
  <tr>
    <td width="35%"><img src="Books/BotsInc/Cover-mini.jpg" width=150></td>
    <td width="65%">
      <p><a href="http://rmod.lille.inria.fr/botsinc/">Squeak: Learn programming with Robots</a>.  St&eacute;phane Ducasse. 
       Apress Publishers, 2005.</p> This book teaches novices of all ages how to program. It is fun, interactive and deep. The book won the september Award of PCPlusMagazin. The first version is sold out after 4 months. A new version is under print. Check <a href="http://rmod.lille.inria.fr/botsinc/">Botsinc''s website</a>. Foreword by Alan Kay the Turing award 2004 (nobel prize in computer science). Here is the book at <a href="http://www.amazon.com/exec/obidos/search-handle-form/002-5536216-8746432">amazon</a>. I wish you a lot of fun with your kids... do not hesitate to share that with me.
    </td>
  </tr>
 
 

  <tr>
    <td width="35%"><img src="Books/Squeak/squeakbook.gif" width=150></td>
    <td width="65%"> 
      <p>Squeak (in french) X. Briffault and St&eacute;phane Ducasse, Eyrolles, 2001.
     This book presents an old version of Squeak. It presents the multimedia, net, the language. It was one of the first book to present in french advanced tools such as refactoring and unit testing. Here is the final versions of some chapters

	 <ul>
		 <li><a href="Books/Squeak/chap02.pdf">chap02.pdf</a>
		 <li><a href="Books/Squeak/chap03.pdf">chap03.pdf</a>
		 <li><a href="Books/Squeak/chap07.pdf">chap07.pdf</a>
		 <li><a href="Books/Squeak/chap11.pdf">chap11.pdf</a>
	</ul>
    </td>
  </tr>
 
 
 
  <tr>
    <td width="35%"><img src="Books/Scheme/couverture.gif" width=150></td>
    <td width="65%">
	<div xmlns="" id="docbook">
      <p> <a href="Books/Scheme/book.html">La programmation : une approche 
        fonctionnelle et recursive avec Scheme</a> L. Arditi and S. Ducasse, Eyrolles, 
        1996.</p>
      <p>This book explains how recursion works, how do you build 
        recursive functions in a way that you are sure that they works. The contents 
        of this book was used in first and second year at the University of Nice-Sophia 
        Antipolis where we had a lot of fun to teach.</p></div>
    </td>
  </tr>
  
  
</table> 

<h2> Columns</h2>
 Here are some of the columns I wrote  for the french journals Programmez!, LinuxPratique and LinuxMagazine.
<ul>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art1-SqueakTour.pdf">Un 
    tour en Squeak</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art2-syntaxeMinimale.pdf">Syntaxe</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art3-Syntax.pdf">Syntaxe 
    par l''exemple</a></li>
   <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art4-Class.pdf">Une 
    premiere classe </a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art5-Introspection.pdf">Introspection 
    en Squeak</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art6-Reflexion.pdf"> 
    Exemples de Reflexion en Squeak</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art7-Refactoring.pdf"> 
    Refactoring browser et SmallLint en Squeak</a></li>
    <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art7-RefactoringVW.pdf"> 
    Refactoring browser et SmallLint en VisualWorks</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art8-SUnit.pdf"> 
    SUnit 3.0 en Squeak</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Art2-Eng-AminimalistSyntax.pdf"> 
    Article 2 translated: The minimalist syntax of Smalltalk</a></li>
  <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/Eng-Art8-SUnit-V1.pdf"> 
    SUnit Explained in english</a></li>
    <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/FinalSeaSideOne.pdf"> 
    Une introduction a SeaSide un framework pour creer des applications web (excellent) </a></li>
	<li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/FinalSeaSideTwo.pdf"> 
    La suite de SeaSide </a></li>
	<li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/seaSideThree.pdf"> 
    Another tutorial on SeaSide in english</a></li>
    <li><a
href="http://www.iam.unibe.ch/~ducasse/Programmez/OnTheWeb/SUnitEnglish2.pdf"> 
    SUnit Explained Revisited (Features SUnit 3.1 and SUnit extensions)in english</a></li>
</ul>

   </div>
   </div>
   </body>
</html>' 
]

{ #category : #'setting context' }
BasePatcher >> streamOf: aFileSystemFile [
	"self new contentsOf: (FileSystem workingDirectory / 'Books.html') "
	stream := aFileSystemFile readStream 
					"converter: Latin1TextConverter new; yourself."
					
]

{ #category : #trying }
BasePatcher >> trying [
	"self new trying"
	
	^ self sample
		copyWithRegex: '-BASE-'
		 matchesReplacedWith: self baseString.
]

{ #category : #trying }
BasePatcher >> tryingContents [
	"self new tryingContents"
	
	^ self sample 
		copyWithRegex: '-BASE-'
		 matchesReplacedWith: contents.
]

{ #category : #experience }
BasePatcher >> untilHead [
	
	| re |
	re := '[\w\W]*<head>(.*)-BASE-(.*)</head>' asRegexIgnoringCase.
	^ (re matchesPrefix: contents)
			ifTrue: [ re subexpression: 1 ].
			
]

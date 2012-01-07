Class {
	#name : #StefSite,
	#superclass : #ARSite,
	#classVars : [
		'CachedSiteSeer'
	],
	#classInstVars : [
		'site',
		'menu',
		'page',
		'main'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
StefSite class >> initialize [

	CachedSiteSeer := true.
]

{ #category : #texts }
StefSite >> awardText [

	^ '	<div class="itemizedlist"> 
      <ul type="disc">
	<li>Distinguished Visiting Fellowship Award of the Royal Academy of Engineering (2011).</li>
	<li>Veronica Uquillas Gomez won the Benevol most promising young research Award (2011).</li>
	<li>Mariano Martinez-Peck and Martin Diaz'' Fuel won the 2011 ESUG Technology Award. .</li>
	<li> <a href="http://books.seaside.st/">Dynamic web development with Seaside</a>: Our new free open-source Seaside book won the ESUG member 2010 best book Award.</li>
	  <li> Michele Lanza (2003) and Alexandre Bergel (2006) PhD theses won the <a href="http://www.denert-stiftung.de/">Ernest Denert foundation for Software Engineering</a> Award.</li>
	  
	  <li> <a href="http://rmod.lille.inria.fr/botsinc/pier">Learning Programming with Robots</a> received the Award of PCPlus magazine of September 2005 and the Bitwise Recommended Award in February 2006.
	  </ul>'

]

{ #category : #elements }
StefSite >> block [ 

	| block |
	block := ARRightBlock new.
	block addElement: (ARImage new image: 'StefFingerOnNose128.jpg'; yourself).
	block addElement: (ARBlockItem new name: 'INRIA'; link: 'http://www.inria.fr/'; yourself).
	block addElement: (ARBlockItem new name: 'RMOD'; link: 'http://rmod.lille.inria.fr/'; yourself).
	block addElement: (ARBlockItem new name: 'Stephane-Ducasse(@)INRIA.FR'; link: 'mailto:stephane.ducasse@inria.fr'; yourself).
	self declare: block withId: #block.
	^ block
	
]

{ #category : #texts }
StefSite >> citeseerText [
	
	|cite |
	cite := CachedSiteSeer 
				ifTrue: [self defaultSiteSeer]
				ifFalse: [(Citeseer rankOf: 'S. Ducasse')].
	^ 'According to <a href="http://citeseerx.ist.psu.edu/stats/authors">CiteSeer</a>, I''m at rank ', cite asString, ' of most cited computer scientists.'.  
]

{ #category : #texts }
StefSite >> currentJobText [

	^ 'Since June 2011, I''m scientific officer of  <a HREF="http://www.inria.fr/centre-de-recherche-inria/lille-nord-europe">INRIA Lille Nord Europe research center</a>. Since September 2007, I''m research director at <a HREF="http://www.inria.fr">INRIA Lille</a> leading the <a href="http://rmod.lille.inria.fr">RMoD Team</a>. During 10 years, I co-directed with Oscar Nierstrasz the <A HREF="http://www.iam.unibe.ch/~scg"> Software Composition Group</a>. I was the leader of the <A HREF="http://www.iam.unibe.ch/~scg/Research/Recast/index.html">RECAST Project</a>.  I''m the president of <a HREF="http://www.esug.org/">ESUG</a>. Here is a short <a HREF="2011-CV.pdf">CV</a>.' 
]

{ #category : #initialize }
StefSite >> defaultSiteSeer [

	^ 3194
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'According to google scholar my h-index is 41 and my g-index is 70 - Maximum Cites: 343.'

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
	"does not work should use fs"
	folder := 'Site/'
]

{ #category : #texts }
StefSite >> keywordsText [

	^ 'Software Engineering, Object-Oriented Programming, Language Design, Reengineering, Reverse Engineering, Program Understanding, Reflective Programming, Dynamically typed languages, Meta-Programming, MOP, Aspect-Oriented Programming, Modules, Frameworks, Design Patterns, Teaching OO, Traits, Classboxes, Scheme, Smalltalk, Java, C#.'

]

{ #category : #elements }
StefSite >> menu [

	| menu |
	menu := ARMenu new.
	menu addElement: (ARMenuItem new name: 'Home'; link: 'index.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Publications'; link: 'Publications.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Books'; link: 'Books.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Free Smalltalk Books'; link: 'FreeBooks.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Downloads/Resources'; link: 'Resources.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Lectures and Presentations'; link: 'Teaching.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Coordinates'; link: 'Coordinates.html'; yourself).
	self declare: menu withId: #menu.
	^ menu 
	
]

{ #category : #texts }
StefSite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
		<li>I was general chair of <a href="http://www.esug.org/wiki/pier/Conferences/2011"> ESUG 2011</a>. </li>
		<li>We got a new associated team named Plomo with Pleiad of University of Chile at Santiago.</li>
	  <li>We are setting up an INRIA consortium with industrial partners around <a href="http://www.pharo-project.org">Pharo</a>. Pharo 1.3 is out and 1.4 is in alpha.</li>
	  <li><a href="http://www.pharo-project.org/pharobyexample/">Pharo By Example</a> is free and out (in spanish, french, english and  japanese)!</li>
	 <li> <a href="http://www.moosetechnology.org">Moose</a>. Moose is a software analysis meta-described platform that allows one to understand and analyze object-oriented applications developed in Smalltalk, Java or C++. Moose 4.3 is out.</li>
	  </ul>
    </div>'
]

{ #category : #texts }
StefSite >> researchText [

	^ '
	My research statement is double: (1) How can we help companies to support the evolution and maintenance of their large applications and (2) how can we improve languages to better support evolution?
	
	'
]

{ #category : #elements }
StefSite >> sectionAwardsAndIndexes [

	| section | 
	section := ARSection new title: 'Awards and Indexes'; text: self indexesText , ' ', self citeseerText,  (Character cr asString), self awardText.
	self declare: section withId: #secAwards.
	^ section
]

{ #category : #elements }
StefSite >> sectionCurrentJob [

	| section | 
	section := ARSection new title: 'Current responsibilities'; text: self currentJobText.
	self declare: section withId: #secCurrentJob.
	^ section
]

{ #category : #elements }
StefSite >> sectionLanguageDesign [

	| section | 
	section := ARSection new title: 'Language Design'; levelDigitString: '3'; text: self researchText. 
	self declare: section withId: #secLanguageDesign.
	^ section
]

{ #category : #elements }
StefSite >> sectionNews [

	| section | 
	section := ARSection new title: 'News'; text: self newsText. 
	self declare: section withId: #secNews.
	^ section
]

{ #category : #elements }
StefSite >> sectionResearch [

	| section | 
	section := ARSection new title: 'Research'; text: self researchText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionSoftwareEvolution [

	| section | 
	section := ARSection new title: 'Maintenance and Software Evolution'; levelDigitString: '3'; text: self researchText ; yourself. 
	self declare: section withId: #secMaintenance.
	^ section
]

{ #category : #elements }
StefSite >> site [
	"self site"
	"in the future the complete web site here"
	
	self welcomePage.
	^ self.
	
]

{ #category : #elements }
StefSite >> welcomePage [
	"self site"
	"in the future the complete web site here"
	
	| welcomePage |
	welcomePage := ARPage new.
	welcomePage name: 'index'.
	self declarePage: welcomePage withId: #welcomePage.

	welcomePage addElement: self menu.
	welcomePage addElementInMain: self block.
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionAwardsAndIndexes.
	welcomePage addElementInMain: self sectionNews.
	welcomePage addElementInMain: self sectionResearch.
	welcomePage addElementInMain: self sectionSoftwareEvolution.
	welcomePage addElementInMain: self sectionLanguageDesign.
	^ welcomePage
	
]

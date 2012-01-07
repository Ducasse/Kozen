Class {
	#name : #StefSite,
	#superclass : #ARSite,
	#classInstVars : [
		'site',
		'menu',
		'page',
		'main'
	],
	#category : #Kozen
}

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

{ #category : #operation }
StefSite >> createSite [
	"self new createSite"
	
	| visitor |
	visitor := ARVisitor new.
	visitor visitSite: self site.
	
]

{ #category : #texts }
StefSite >> currentJobText [

	^ 'Since June 2011, I''m scientific officer of  <a HREF="http://www.inria.fr/centre-de-recherche-inria/lille-nord-europe">INRIA Lille Nord Europe research center</a>. Since September 2007, I''m research director at <a HREF="http://www.inria.fr">INRIA Lille</a> leading the <a href="http://rmod.lille.inria.fr">RMoD Team</a>. During 10 years, I co-directed with Oscar Nierstrasz the <A HREF="http://www.iam.unibe.ch/~scg"> Software Composition Group</a>. I was the leader of the <A HREF="http://www.iam.unibe.ch/~scg/Research/Recast/index.html">RECAST Project</a>.  I''m the president of <a HREF="http://www.esug.org/">ESUG</a>. Here is a short <a HREF="2011-CV.pdf">CV</a>.' 
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'According to google scholar my h-index is 41 and my g-index is 70 - Maximum Cites: 343.'

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
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
	menu addElement: (ARMenuItem new name: 'Coordinates'; link: 'Coordinates.html'; yourself).

	self declare: menu withId: #menu.
	^ menu 
	
]

{ #category : #elements }
StefSite >> sectionCurrentJob [

	| section | 
	section := ARSection new title: 'Current responsibilities'; text: self currentJobText.
	self declare: section withId: #secCurrentJob.
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
	self menu.
	self block.
	self sectionCurrentJob.
	
	welcomePage addElement: (elements at: #menu).
	welcomePage addElementInMain: (elements at: #block).
	welcomePage addElementInMain: (elements at: #secCurrentJob).
	^ welcomePage
	
]

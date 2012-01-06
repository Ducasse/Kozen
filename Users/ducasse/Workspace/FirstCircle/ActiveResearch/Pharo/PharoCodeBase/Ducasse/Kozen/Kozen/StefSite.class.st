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

{ #category : #elements }
StefSite >> createSite [
	"self new createSite"
	
	| visitor |
	visitor := ARVisitor new.
	visitor visitPage: self site.
	^ visitor contents
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'According to google scholar my h-index is 41 and my g-index is 70 - Maximum Cites: 343.'

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
StefSite >> site [
	"self site"
	"in the future the complete web site here"
	
	| welcomePage |
	welcomePage := ARPage new.
	welcomePage name: 'index'.
	
	self declare: welcomePage withId: #welcomePage.
	self menu.
	self block.
	welcomePage addElement: (elements at: #menu).
	welcomePage addElementInMain: (elements at: #block).
	
	^ welcomePage
	
]

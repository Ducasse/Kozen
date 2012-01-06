Class {
	#name : #StefSite,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#classInstVars : [
		'site',
		'menu',
		'page',
		'main'
	],
	#category : #Kozen
}

{ #category : #'create site' }
StefSite class >> block [

	menu := ARRightBlock new.
	menu addElement: (ARImage new image: 'StefFingerOnNose128.jpg'; yourself).
	menu addElement: (ARBlockItem new name: 'INRIA'; link: 'http://www.inria.fr/'; yourself).
	menu addElement: (ARBlockItem new name: 'RMOD'; link: 'http://rmod.lille.inria.fr/'; yourself).
	menu addElement: (ARBlockItem new name: 'Stephane-Ducasse(@)INRIA.FR'; link: 'mailto:stephane.ducasse@inria.fr'; yourself).
	^ menu
	
]

{ #category : #'create site' }
StefSite class >> createSite [
	"self createSite"
	
	| visitor |
	visitor := ARVisitor new.
	visitor visitPage: self site.
	^ visitor contents
]

{ #category : #'create site' }
StefSite class >> main [

	main :=  ARDivBlock new attribute: 'id' ; value: 'mainContent'.
	^ main
]

{ #category : #'create site' }
StefSite class >> menu [

	menu := ARMenu new.
	menu addElement: (ARMenuItem new name: 'Home'; link: 'index.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Publications'; link: 'Publications.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Coordinates'; link: 'Coordinates.html'; yourself).
	"in the future the link should be computed based on the site"
	^ menu 
	
]

{ #category : #'create site' }
StefSite class >> sectionResponsibilities [

	
	page := ARPage new.
	page addElement: self menu.
	page addElement: self main.
	main addElement: self block.
	^ page
	
]

{ #category : #'create site' }
StefSite class >> site [
	"self site"
	
	page := ARPage new.
	page addElement: self menu.
	page addElement: self main.
	main addElement: self block.
	^ page
	
]

{ #category : #initialize }
StefSite >> initialize [

	super initialize.
	elements := Dictionary new
]

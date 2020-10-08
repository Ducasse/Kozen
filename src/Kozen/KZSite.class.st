"
A KZSite represents all the information for a site composed by pages. 
"
Class {
	#name : #KZSite,
	#superclass : #Object,
	#instVars : [
		'elements',
		'pages'
	],
	#category : #Kozen
}

{ #category : #visiting }
KZSite >> acceptVisitor: aVisitor [

	aVisitor visitSite: aVisitor
]

{ #category : #operations }
KZSite >> declare: anElement withId: anID [
	"Declare the element with a given id so that we can link back to it"
	
	elements at: anID put: anElement
]

{ #category : #operations }
KZSite >> declarePage: aPage withId: anID [
	"Declare a page with a given id for future reference. A page is also added to the site web page."
	elements at: anID put: aPage.
	aPage site: self.
	pages add: aPage.
]

{ #category : #operations }
KZSite >> generate [
	"self new generate"
	
	| visitor |
	visitor := self visitorClass new.
	visitor visitSite: self site.
	
]

{ #category : #initialize }
KZSite >> initialize [

	super initialize.
	elements := Dictionary new.
	pages := OrderedCollection new.
]

{ #category : #operations }
KZSite >> pages [
	^ pages
]

{ #category : #accessing }
KZSite >> site [

	self subclassResponsibility
	
]

{ #category : #operations }
KZSite >> visitorClass [

	^  KZVisitor 
]

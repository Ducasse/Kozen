Class {
	#name : #ARSite,
	#superclass : #Object,
	#instVars : [
		'elements',
		'pages',
		'folder'
	],
	#category : #Kozen
}

{ #category : #initialize }
ARSite >> addPage: aPage [

	pages add: aPage
]

{ #category : #operations }
ARSite >> declare: anElement withId: anID [

	elements at: anID put: anElement
]

{ #category : #operations }
ARSite >> declarePage: anElement withId: anID [

	elements at: anID put: anElement.
	anElement site: self.
	pages add: anElement.
]

{ #category : #initialize }
ARSite >> filenameForPage: aPage [
	^ folder, aPage name, '.html'
]

{ #category : #operations }
ARSite >> folder [
	
	^ folder
]

{ #category : #initialize }
ARSite >> initialize [

	super initialize.
	elements := Dictionary new.
	pages := OrderedCollection new.
]

{ #category : #operations }
ARSite >> pages [
	^ pages
]

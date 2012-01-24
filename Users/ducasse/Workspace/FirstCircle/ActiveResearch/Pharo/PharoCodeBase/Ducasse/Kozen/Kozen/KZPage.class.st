"
I'm a page and as such I contain elements and I'm saved in a file.
"
Class {
	#name : #KZPage,
	#superclass : #KZObject,
	#instVars : [
		'title',
		'elements',
		'head',
		'name',
		'main',
		'site',
		'filename',
		'cssFile',
		'headerSiteTitle'
	],
	#category : #Kozen
}

{ #category : #'instance creation' }
KZPage class >> name: aString filename: aFileName [

	^ self new name: aString; filename: aFileName; yourself
]

{ #category : #visiting }
KZPage >> accept: aVisitor [

	aVisitor visitPage: self.

]

{ #category : #adding }
KZPage >> addElement: anElement [

	elements add: anElement.
]

{ #category : #adding }
KZPage >> addElementInMain: anElement [

	main addElement: anElement.
]

{ #category : #accessing }
KZPage >> cssFile [
	^cssFile
]

{ #category : #accessing }
KZPage >> cssFile: aString [
	
	cssFile := aString
]

{ #category : #default }
KZPage >> defaultCSSFile [
	^ 'CSS/stef.css'
]

{ #category : #default }
KZPage >> defaultName [

	^ 'Home'
]

{ #category : #default }
KZPage >> defaultTitle [

	^ 'The title can also give some information about you' 
]

{ #category : #accessing }
KZPage >> elements [

	^ elements
]

{ #category : #accessing }
KZPage >> filename [
	
	|fn|
	filename isNil 
		ifTrue: [fn := name]
		ifFalse: [fn := filename].
	^ fn, '.html'.
	
]

{ #category : #accessing }
KZPage >> filename: aName [
	
	filename := aName
]

{ #category : #accessing }
KZPage >> head [

	^ '<head>
		<link rel="stylesheet" href="' , self cssFile
		,
			'"/>
		<title>' , self defaultTitle
		,
			'</title>
   </head>'
]

{ #category : #accessing }
KZPage >> headerPageTitle [

	^ self name

]

{ #category : #accessing }
KZPage >> headerSiteTitle [
	"the title inside the page"
	
	^ headerSiteTitle
]

{ #category : #accessing }
KZPage >> headerSiteTitle: aString [
	"the title inside the page"
	
	headerSiteTitle := aString
]

{ #category : #'initialize-release' }
KZPage >> initialize [

	super initialize.
	elements := OrderedCollection new.
	title := self defaultTitle.
	name := self defaultName.
	cssFile := self defaultCSSFile.
	main := KZDivBlock new attribute: 'id' ; value: 'mainContent'.
]

{ #category : #accessing }
KZPage >> main [
	"describes the main part of the body - related to css may be we should change that but 
	menu should be out and block and section nested in."
	
	^ main
]

{ #category : #accessing }
KZPage >> metaHead [

	^ '<?xml version="1.0" encoding="ISO-8859-1"?>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">'
]

{ #category : #accessing }
KZPage >> name [ 
	"For example the welcomePage can be called Home "
	^ name
]

{ #category : #accessing }
KZPage >> name: aString [
	name := aString
]

{ #category : #printing }
KZPage >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream nextPutAll: self name. 
]

{ #category : #accessing }
KZPage >> site [

	^ site
]

{ #category : #accessing }
KZPage >> site:  aSite [

	site := aSite
]

{ #category : #accessing }
KZPage >> title [

	^ title 
]

{ #category : #accessing }
KZPage >> title: aString [

	title := aString
]

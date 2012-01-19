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
		'filename'
	],
	#category : #Kozen
}

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

{ #category : #default }
KZPage >> defaultHead [

	^ '<head>
		<link rel="stylesheet" href="CSS/stef.css"/>
		<title>Dr. St&eacute;phane Ducasse</title>
   </head>'
]

{ #category : #default }
KZPage >> defaultName [

	^ 'Home'
]

{ #category : #default }
KZPage >> defaultTitle [

	^ 'Dr. St&eacute;phane Ducasse' 
]

{ #category : #accessing }
KZPage >> elements [

	^ elements
]

{ #category : #visiting }
KZPage >> filename [
	
	|fn|
	filename isNil 
		ifTrue: [fn := name]
		ifFalse: [fn := filename].
	^ fn, '.html'.
	
]

{ #category : #visiting }
KZPage >> filename: aName [
	
	filename := aName
]

{ #category : #accessing }
KZPage >> head [

	^ head
]

{ #category : #accessing }
KZPage >> headerPageTitle [

	^ self name

]

{ #category : #accessing }
KZPage >> headerSiteTitle [

	^ 'St&eacute;phane Ducasse'
]

{ #category : #'initialize-release' }
KZPage >> initialize [

	super initialize.
	elements := OrderedCollection new.
	head := self defaultHead.
	title := self defaultTitle.
	name := self defaultName.
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

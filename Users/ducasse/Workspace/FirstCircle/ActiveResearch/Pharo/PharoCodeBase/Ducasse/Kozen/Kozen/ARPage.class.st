"
ARPage has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

ARPage should hide the fact that elements can be or not in main.
Elements should returns what it should.
"
Class {
	#name : #ARPage,
	#superclass : #ARObject,
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
ARPage >> accept: aVisitor [

	aVisitor visitPage: self.

]

{ #category : #adding }
ARPage >> addElement: anElement [

	elements add: anElement.
]

{ #category : #adding }
ARPage >> addElementInMain: anElement [

	main addElement: anElement.
]

{ #category : #default }
ARPage >> defaultHead [

	^ '<head>
		<link rel="stylesheet" href="CSS/stef.css"/>
		<title>Dr. St&eacute;phane Ducasse</title>
   </head>'
]

{ #category : #default }
ARPage >> defaultName [

	^ 'Home'
]

{ #category : #default }
ARPage >> defaultTitle [

	^ 'Dr. St&eacute;phane Ducasse' 
]

{ #category : #accessing }
ARPage >> elements [

	^ elements
]

{ #category : #visiting }
ARPage >> filename [
	
	|fn|
	filename isNil 
		ifTrue: [fn := name]
		ifFalse: [fn := filename].
	^ fn, '.html'.
	
]

{ #category : #visiting }
ARPage >> filename: aName [
	
	filename := aName
]

{ #category : #accessing }
ARPage >> head [

	^ head
]

{ #category : #accessing }
ARPage >> headerPageTitle [

	^ self name

]

{ #category : #accessing }
ARPage >> headerSiteTitle [

	^ 'St&eacute;phane Ducasse'
]

{ #category : #'initialize-release' }
ARPage >> initialize [

	super initialize.
	elements := OrderedCollection new.
	head := self defaultHead.
	title := self defaultTitle.
	name := self defaultName.
	main := ARDivBlock new attribute: 'id' ; value: 'mainContent'.
]

{ #category : #accessing }
ARPage >> main [
	"describes the main part of the body - related to css may be we should change that but 
	menu should be out and block and section nested in."
	
	^ main
]

{ #category : #accessing }
ARPage >> metaHead [

	^ '<?xml version="1.0" encoding="ISO-8859-1"?>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">'
]

{ #category : #accessing }
ARPage >> name [ 

	^ name
]

{ #category : #accessing }
ARPage >> name: aString [
	name := aString
]

{ #category : #printing }
ARPage >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream nextPutAll: self name. 
]

{ #category : #accessing }
ARPage >> site [

	^ site
]

{ #category : #accessing }
ARPage >> site:  aSite [

	site := aSite
]

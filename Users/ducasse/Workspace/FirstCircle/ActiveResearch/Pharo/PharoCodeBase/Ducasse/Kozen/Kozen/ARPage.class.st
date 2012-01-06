Class {
	#name : #ARPage,
	#superclass : #ARObject,
	#instVars : [
		'title',
		'elements',
		'head',
		'name',
		'main'
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

{ #category : #'initialize-release' }
ARPage >> defaultHead [

	^ '<head>
		<link rel="stylesheet" href="CSS/stef.css"/>
		<title>Dr. Stéphane Ducasse</title>
   </head>'
]

{ #category : #'initialize-release' }
ARPage >> defaultName [

	^ 'Home'
]

{ #category : #'initialize-release' }
ARPage >> defaultTitle [

	^ 'Dr. Stéphane Ducasse'
]

{ #category : #accessing }
ARPage >> elements [

	^ elements
]

{ #category : #accessing }
ARPage >> head [

	^ head
]

{ #category : #accessing }
ARPage >> header [

	^ '<div id="header">
         <div id="headerSiteTitle">Stéphane Ducasse</div>
         <div id="headerPageTitle">', self name, '</div>
      </div>'
]

{ #category : #accessing }
ARPage >> headerPageTitle [

	^ self name

]

{ #category : #accessing }
ARPage >> headerSiteTitle [

	^ 'Stéphane Ducasse'
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

{ #category : #'initialize-release' }
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

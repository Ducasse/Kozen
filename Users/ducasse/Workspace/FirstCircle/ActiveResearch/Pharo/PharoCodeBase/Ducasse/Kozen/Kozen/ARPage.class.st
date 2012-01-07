Class {
	#name : #ARPage,
	#superclass : #ARObject,
	#instVars : [
		'title',
		'elements',
		'head',
		'name',
		'main',
		'site'
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
		<title>Dr. Stéphane Ducasse</title>
   </head>'
]

{ #category : #default }
ARPage >> defaultName [

	^ 'Home'
]

{ #category : #default }
ARPage >> defaultTitle [

	^ 'Dr. Stéphane Ducasse'
]

{ #category : #accessing }
ARPage >> elements [

	^ elements
]

{ #category : #visiting }
ARPage >> filename [
	
	| filename |
	filename := self name, '.html'.
	"does not work for file creation should use fs"
	"^ site ifNil: [filename] ifNotNil: [site folder, filename] "
	^ filename
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

{ #category : #accessing }
ARPage >> site [

	^ site
]

{ #category : #accessing }
ARPage >> site:  aSite [

	site := aSite
]

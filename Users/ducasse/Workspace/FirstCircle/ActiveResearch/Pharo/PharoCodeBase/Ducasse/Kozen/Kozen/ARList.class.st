Class {
	#name : #ARList,
	#superclass : #ARObject,
	#instVars : [
		'elements'
	],
	#category : #Kozen
}

{ #category : #elements }
ARList >> addElement: anElement [

	elements add: anElement
]

{ #category : #elements }
ARList >> elements [

	^ elements
]

{ #category : #initialize }
ARList >> initialize [

	super initialize.
	elements := OrderedCollection new.
]

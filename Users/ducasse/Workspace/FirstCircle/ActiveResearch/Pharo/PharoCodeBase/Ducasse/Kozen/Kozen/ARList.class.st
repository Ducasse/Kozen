Class {
	#name : #ARList,
	#superclass : #ARObject,
	#instVars : [
		'elements'
	],
	#category : #Kozen
}

{ #category : #visit }
ARList >> accept: aVisitor [

	aVisitor visitItemList: self
]

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

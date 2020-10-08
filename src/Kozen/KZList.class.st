"
A KZList is sequence of more elements
"
Class {
	#name : #KZList,
	#superclass : #KZObject,
	#instVars : [
		'elements'
	],
	#category : #Kozen
}

{ #category : #visit }
KZList >> acceptVisitor: aVisitor [

	aVisitor visitItemList: self
]

{ #category : #elements }
KZList >> addElement: anElement [

	elements add: anElement
]

{ #category : #elements }
KZList >> elements [

	^ elements
]

{ #category : #initialize }
KZList >> initialize [

	super initialize.
	elements := OrderedCollection new.
]

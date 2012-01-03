Class {
	#name : #ARMenu,
	#superclass : #ARObject,
	#instVars : [
		'elements'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
ARMenu >> accept: aVisitor [

	aVisitor visitMenu: self.

]

{ #category : #'as yet unclassified' }
ARMenu >> addElement: anElement [

	elements add: anElement
]

{ #category : #'as yet unclassified' }
ARMenu >> elements [

	^ elements
]

{ #category : #'as yet unclassified' }
ARMenu >> initialize [

	super initialize.
	elements := OrderedCollection new.
]

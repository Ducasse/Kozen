Class {
	#name : #ARMenuItem,
	#superclass : #ARObject,
	#instVars : [
		'name',
		'link'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
ARMenuItem >> accept: aVisitor [

	aVisitor visitMenuItem: self.

]

{ #category : #'as yet unclassified' }
ARMenuItem >> link [
	
	^ link
]

{ #category : #'as yet unclassified' }
ARMenuItem >> link: aName [

	link := aName
]

{ #category : #'as yet unclassified' }
ARMenuItem >> name [

	^ name
]

{ #category : #'as yet unclassified' }
ARMenuItem >> name:  aString [

	name := aString
]

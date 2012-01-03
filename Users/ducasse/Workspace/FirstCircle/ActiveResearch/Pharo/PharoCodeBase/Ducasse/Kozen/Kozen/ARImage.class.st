Class {
	#name : #ARImage,
	#superclass : #ARObject,
	#instVars : [
		'image'
	],
	#category : #Kozen
}

{ #category : #accessing }
ARImage >> accept: aVisitor [

	aVisitor visitImage: self.

]

{ #category : #accessing }
ARImage >> image [
	^ image
]

{ #category : #accessing }
ARImage >> image: anObject [
	image := anObject
]

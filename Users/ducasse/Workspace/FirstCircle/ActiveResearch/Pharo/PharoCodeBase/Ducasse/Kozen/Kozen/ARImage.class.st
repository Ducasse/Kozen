Class {
	#name : #ARImage,
	#superclass : #ARObject,
	#instVars : [
		'image',
		'link'
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

{ #category : #accessing }
ARImage >> link [
	^ link
]

{ #category : #accessing }
ARImage >> link: anObject [
	link := anObject
]

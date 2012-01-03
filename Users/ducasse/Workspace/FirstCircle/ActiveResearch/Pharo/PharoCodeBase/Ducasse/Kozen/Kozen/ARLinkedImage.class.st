Class {
	#name : #ARLinkedImage,
	#superclass : #ARImage,
	#instVars : [
		'link'
	],
	#category : #Kozen
}

{ #category : #visit }
ARLinkedImage >> accept: aVisitor [

	aVisitor visitLinkedImage: self
]

{ #category : #accessing }
ARLinkedImage >> link [
	^ link
]

{ #category : #accessing }
ARLinkedImage >> link: anObject [
	link := anObject
]

Class {
	#name : #KZLinkedImage,
	#superclass : #KZImage,
	#instVars : [
		'link'
	],
	#category : #Kozen
}

{ #category : #visit }
KZLinkedImage >> accept: aVisitor [

	aVisitor visitLinkedImage: self
]

{ #category : #accessing }
KZLinkedImage >> link [
	^ link
]

{ #category : #accessing }
KZLinkedImage >> link: anObject [
	link := anObject
]

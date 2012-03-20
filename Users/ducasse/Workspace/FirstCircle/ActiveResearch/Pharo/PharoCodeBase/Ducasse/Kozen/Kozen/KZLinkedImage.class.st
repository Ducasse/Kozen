Class {
	#name : #KZLinkedImage,
	#superclass : #KZImage,
	#instVars : [
		'link'
	],
	#category : #Kozen
}

{ #category : #visit }
KZLinkedImage >> acceptVisitor: aVisitor [

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

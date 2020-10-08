"
A KZImage is a simple image
"
Class {
	#name : #KZImage,
	#superclass : #KZObject,
	#instVars : [
		'image'
	],
	#category : #Kozen
}

{ #category : #visiting }
KZImage >> acceptVisitor: aVisitor [

	aVisitor visitImage: self.

]

{ #category : #accessing }
KZImage >> image [
	^ image
]

{ #category : #accessing }
KZImage >> image: anObject [
	image := anObject
]

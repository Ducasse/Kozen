Class {
	#name : #KZMenuItem,
	#superclass : #KZItem,
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
KZMenuItem >> accept: aVisitor [

	aVisitor visitMenuItem: self.

]

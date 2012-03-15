Class {
	#name : #KZMenuItem,
	#superclass : #KZItem,
	#category : #Kozen
}

{ #category : #visitor }
KZMenuItem >> accept: aVisitor [

	aVisitor visitMenuItem: self.

]

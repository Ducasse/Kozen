"
A KZMenuItem is item for menu navigation
"
Class {
	#name : #KZMenuItem,
	#superclass : #KZItem,
	#category : #Kozen
}

{ #category : #visitor }
KZMenuItem >> acceptVisitor: aVisitor [

	aVisitor visitMenuItem: self.

]

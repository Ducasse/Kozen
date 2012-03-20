Class {
	#name : #KZMenu,
	#superclass : #KZList,
	#category : #Kozen
}

{ #category : #visit }
KZMenu >> acceptVisitor: aVisitor [

	aVisitor visitMenu: self.

]

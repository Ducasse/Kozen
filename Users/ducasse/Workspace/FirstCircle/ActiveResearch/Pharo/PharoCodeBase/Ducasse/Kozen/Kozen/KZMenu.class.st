Class {
	#name : #KZMenu,
	#superclass : #KZList,
	#category : #Kozen
}

{ #category : #visit }
KZMenu >> accept: aVisitor [

	aVisitor visitMenu: self.

]

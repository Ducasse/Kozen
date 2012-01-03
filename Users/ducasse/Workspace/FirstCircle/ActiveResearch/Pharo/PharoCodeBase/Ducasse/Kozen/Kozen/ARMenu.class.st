Class {
	#name : #ARMenu,
	#superclass : #ARList,
	#category : #Kozen
}

{ #category : #visit }
ARMenu >> accept: aVisitor [

	aVisitor visitMenu: self.

]

Class {
	#name : #ARRightBlock,
	#superclass : #ARList,
	#category : #Kozen
}

{ #category : #visit }
ARRightBlock >> accept: aVisitor [

	aVisitor visitRightBlock: self.
]

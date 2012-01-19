Class {
	#name : #KZRightBlock,
	#superclass : #KZList,
	#category : #Kozen
}

{ #category : #visit }
KZRightBlock >> accept: aVisitor [

	aVisitor visitRightBlock: self.
]

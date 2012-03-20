Class {
	#name : #KZRightBlock,
	#superclass : #KZList,
	#category : #Kozen
}

{ #category : #visit }
KZRightBlock >> acceptVisitor: aVisitor [

	aVisitor visitRightBlock: self.
]

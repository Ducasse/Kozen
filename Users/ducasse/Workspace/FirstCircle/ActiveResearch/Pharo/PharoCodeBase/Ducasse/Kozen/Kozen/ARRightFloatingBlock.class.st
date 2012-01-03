Class {
	#name : #ARRightFloatingBlock,
	#superclass : #ARList,
	#category : #Kozen
}

{ #category : #visit }
ARRightFloatingBlock >> accept: aVisitor [

	aVisitor visitRightBlock: self.
]

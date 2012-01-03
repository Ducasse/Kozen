Class {
	#name : #ARMenuItem,
	#superclass : #ARItem,
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
ARMenuItem >> accept: aVisitor [

	aVisitor visitMenuItem: self.

]

"
ARBlockItem is an item of a floating block. For example like on the right of my web page.
"
Class {
	#name : #KZBlockItem,
	#superclass : #KZItem,
	#category : #Kozen
}

{ #category : #visit }
KZBlockItem >> accept: aVisitor [

	aVisitor visitRightBlockItem: self.

]

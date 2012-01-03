"
ARBlockItem is an item of a floating block. For example like on the right of my web page.
"
Class {
	#name : #ARBlockItem,
	#superclass : #ARItem,
	#category : #Kozen
}

{ #category : #visit }
ARBlockItem >> accept: aVisitor [

	aVisitor visitRightBlockItem: self.

]

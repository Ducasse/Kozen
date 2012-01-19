"
<div id=""header"">
	attribute = id 
	value = header
	
	and nested components
	

"
Class {
	#name : #KZDivBlock,
	#superclass : #KZList,
	#instVars : [
		'attribute'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
KZDivBlock >> accept: aVisitor [

	aVisitor visitDivBlock: self.

]

{ #category : #'as yet unclassified' }
KZDivBlock >> attribute [
	^ attribute
]

{ #category : #'as yet unclassified' }
KZDivBlock >> attribute: aString [
	
	attribute := aString
]

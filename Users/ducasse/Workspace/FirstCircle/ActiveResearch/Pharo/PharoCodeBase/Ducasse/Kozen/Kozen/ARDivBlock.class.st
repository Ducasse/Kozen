"
<div id=""header"">
	attribute = id 
	value = header
	
	and nested components
	

"
Class {
	#name : #ARDivBlock,
	#superclass : #ARList,
	#instVars : [
		'attribute'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
ARDivBlock >> accept: aVisitor [

	aVisitor visitDivBlock: self.

]

{ #category : #'as yet unclassified' }
ARDivBlock >> attribute [
	^ attribute
]

{ #category : #'as yet unclassified' }
ARDivBlock >> attribute: aString [
	
	attribute := aString
]

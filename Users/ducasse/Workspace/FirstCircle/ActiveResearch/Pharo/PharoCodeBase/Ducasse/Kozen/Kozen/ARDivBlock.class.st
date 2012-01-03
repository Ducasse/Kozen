"
<div id=""header"">

	attribute = id 
	tag = header
"
Class {
	#name : #ARDivBlock,
	#superclass : #ARObject,
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

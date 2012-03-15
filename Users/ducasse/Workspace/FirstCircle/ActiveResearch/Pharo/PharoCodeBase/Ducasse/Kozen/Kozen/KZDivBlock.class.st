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

{ #category : #visiting }
KZDivBlock >> accept: aVisitor [

	aVisitor visitDivBlock: self.

]

{ #category : #accessing }
KZDivBlock >> attribute [
	^ attribute
]

{ #category : #accessing }
KZDivBlock >> attribute: aString [
	
	attribute := aString
]

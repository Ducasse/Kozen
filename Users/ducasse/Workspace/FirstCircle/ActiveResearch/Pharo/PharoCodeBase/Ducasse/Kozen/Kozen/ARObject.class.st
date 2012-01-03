Class {
	#name : #ARObject,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #Kozen
}

{ #category : #accessing }
ARObject >> accept: aVisitor [
	
]

{ #category : #accessing }
ARObject >> value [
	^ value
]

{ #category : #accessing }
ARObject >> value: aString [
	value := aString
]

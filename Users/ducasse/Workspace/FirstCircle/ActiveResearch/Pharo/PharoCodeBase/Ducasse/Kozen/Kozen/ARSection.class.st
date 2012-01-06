Class {
	#name : #ARSection,
	#superclass : #ARList,
	#instVars : [
		'title',
		'text'
	],
	#category : #Kozen
}

{ #category : #accessing }
ARSection >> accept: aVisitor [

	aVisitor visitSection: self
]

{ #category : #accessing }
ARSection >> text [
	^ text
]

{ #category : #accessing }
ARSection >> text: anObject [
	text := anObject
]

{ #category : #accessing }
ARSection >> title [
	^ title
]

{ #category : #accessing }
ARSection >> title: anObject [
	title := anObject
]

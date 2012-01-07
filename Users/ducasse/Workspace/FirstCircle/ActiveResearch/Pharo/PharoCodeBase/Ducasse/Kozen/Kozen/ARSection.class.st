Class {
	#name : #ARSection,
	#superclass : #ARList,
	#instVars : [
		'levelNumber',
		'title',
		'text'
	],
	#category : #Kozen
}

{ #category : #accessing }
ARSection >> accept: aVisitor [

	aVisitor visitSection: self
]

{ #category : #initialize }
ARSection >> initialize [

	super initialize.
	levelNumber := '2'.
]

{ #category : #accessing }
ARSection >> levelDigitString [

	^ levelNumber
]

{ #category : #accessing }
ARSection >> levelDigitString: aString [
	"'2' for h2, '3' for h3...."

	levelNumber := aString
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

Class {
	#name : #KZSection,
	#superclass : #KZList,
	#instVars : [
		'levelNumber',
		'title',
		'text'
	],
	#category : #Kozen
}

{ #category : #accessing }
KZSection >> accept: aVisitor [

	aVisitor visitSection: self
]

{ #category : #initialize }
KZSection >> initialize [

	super initialize.
	levelNumber := '2'.
]

{ #category : #accessing }
KZSection >> levelDigitString [

	^ levelNumber
]

{ #category : #accessing }
KZSection >> levelDigitString: aString [
	"'2' for h2, '3' for h3...."

	levelNumber := aString
]

{ #category : #accessing }
KZSection >> text [
	^ text
]

{ #category : #accessing }
KZSection >> text: anObject [
	text := anObject
]

{ #category : #accessing }
KZSection >> title [
	^ title
]

{ #category : #accessing }
KZSection >> title: anObject [
	title := anObject
]

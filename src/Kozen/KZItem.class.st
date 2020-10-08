"
A KZItem is item of menu or menu like list.
"
Class {
	#name : #KZItem,
	#superclass : #KZObject,
	#instVars : [
		'name',
		'link'
	],
	#category : #Kozen
}

{ #category : #visit }
KZItem >> acceptVisitor: aVisitor [

	aVisitor visitItem: self.
]

{ #category : #accessing }
KZItem >> link [
	
	^ link
]

{ #category : #accessing }
KZItem >> link: aName [

	link := aName
]

{ #category : #accessing }
KZItem >> name [

	^ name
]

{ #category : #accessing }
KZItem >> name:  aString [

	name := aString
]

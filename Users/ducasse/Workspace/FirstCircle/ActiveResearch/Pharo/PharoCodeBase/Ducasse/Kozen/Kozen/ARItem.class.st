Class {
	#name : #ARItem,
	#superclass : #ARObject,
	#instVars : [
		'name',
		'link'
	],
	#category : #Kozen
}

{ #category : #visit }
ARItem >> accept: aVisitor [

	aVisitor visitItem: self.
]

{ #category : #accessing }
ARItem >> link [
	
	^ link
]

{ #category : #accessing }
ARItem >> link: aName [

	link := aName
]

{ #category : #accessing }
ARItem >> name [

	^ name
]

{ #category : #accessing }
ARItem >> name:  aString [

	name := aString
]

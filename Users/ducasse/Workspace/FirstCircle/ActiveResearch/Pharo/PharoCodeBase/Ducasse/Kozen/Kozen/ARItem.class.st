Class {
	#name : #ARItem,
	#superclass : #ARObject,
	#instVars : [
		'name',
		'link'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
ARItem >> link [
	
	^ link
]

{ #category : #'as yet unclassified' }
ARItem >> link: aName [

	link := aName
]

{ #category : #'as yet unclassified' }
ARItem >> name [

	^ name
]

{ #category : #'as yet unclassified' }
ARItem >> name:  aString [

	name := aString
]

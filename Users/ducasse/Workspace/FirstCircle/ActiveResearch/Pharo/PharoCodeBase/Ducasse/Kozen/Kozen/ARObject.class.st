Class {
	#name : #ARObject,
	#superclass : #Object,
	#instVars : [
		'value',
		'siteId'
	],
	#category : #Kozen
}

{ #category : #accessing }
ARObject >> accept: aVisitor [
	
]

{ #category : #accessing }
ARObject >> siteId [
	^ siteId
]

{ #category : #accessing }
ARObject >> siteId: anId [
	"anId should uniquely identify the receiver"
	siteId := anId
]

{ #category : #accessing }
ARObject >> value [
	^ value
]

{ #category : #accessing }
ARObject >> value: aString [
	value := aString
]

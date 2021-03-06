"
A KZObject is the root of Kozen object : objects that models a web site.
"
Class {
	#name : #KZObject,
	#superclass : #Object,
	#instVars : [
		'value',
		'siteId'
	],
	#category : #Kozen
}

{ #category : #visiting }
KZObject >> acceptVisitor: aVisitor [
	
]

{ #category : #accessing }
KZObject >> siteId [
	^ siteId
]

{ #category : #accessing }
KZObject >> siteId: anId [
	"anId should uniquely identify the receiver"
	siteId := anId
]

{ #category : #accessing }
KZObject >> value [
	^ value
]

{ #category : #accessing }
KZObject >> value: aString [
	value := aString
]

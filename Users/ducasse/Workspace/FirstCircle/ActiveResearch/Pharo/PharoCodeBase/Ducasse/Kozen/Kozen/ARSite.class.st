Class {
	#name : #ARSite,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #Kozen
}

{ #category : #operations }
ARSite >> declare: anElement withId: anID [

	elements at: anID put: anElement
]

{ #category : #initialize }
ARSite >> initialize [

	super initialize.
	elements := Dictionary new
]

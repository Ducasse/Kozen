"
I'm a wrapper so that I can be put in a site structure but holding items of citezen.
during my visit the visitor can decide to invoke a citezen exporter. 

Not clear at the design level yet.
"
Class {
	#name : #KZBibCollection,
	#superclass : #KZList,
	#category : #'KoCizen-Bib'
}

{ #category : #visiting }
KZBibCollection >> acceptVisitor: aVisitor [

	aVisitor visitBibItemCollection: self
]

{ #category : #accessing }
KZBibCollection >> elements: aCol [

	elements := aCol
]

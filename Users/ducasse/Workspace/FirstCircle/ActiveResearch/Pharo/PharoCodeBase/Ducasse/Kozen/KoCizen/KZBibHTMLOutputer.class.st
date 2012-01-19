"
A specific Citezen outputer for HTML. In the future we should completely rewrite part of Citezen and we may not need this class anymore.
"
Class {
	#name : #KZBibHTMLOutputer,
	#superclass : #CZHtmlOutputer,
	#instVars : [
		'fieldOrder'
	],
	#category : #KoCizen
}

{ #category : #accessing }
KZBibHTMLOutputer >> fieldOrder [
	^ fieldOrder
]

{ #category : #accessing }
KZBibHTMLOutputer >> fieldOrder: anObject [
	fieldOrder := anObject
]

{ #category : #initialize }
KZBibHTMLOutputer >> initialize [

	super initialize.
	fieldOrder := #(#author 
			  #title 
			  #journal 
			  #booktitle 
			  #volume 
			  #pages 
			  #publisher  
			  #year 
			  #impactfactor 
			  #rate 
			  #url 
			  #doi)
]

{ #category : #visit }
KZBibHTMLOutputer >> visitEntry: anEntry [
	
	| fields |
	fields := anEntry fieldSortedFollowingKeys: fieldOrder. 
	outputStream 
		nextPutAll: '<li>'.
	fields
		 do: [ :each | each acceptVisitor: self]
		 separatedBy: [outputStream nextPutAll: ', '].
	outputStream nextPut: $. .
	outputStream 
		nextPutAll: '</li>'.
]

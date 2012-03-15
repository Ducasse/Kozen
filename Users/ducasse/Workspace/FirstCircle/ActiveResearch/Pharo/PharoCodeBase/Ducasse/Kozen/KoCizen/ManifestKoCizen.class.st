Class {
	#name : #ManifestKoCizen,
	#superclass : #Object,
	#category : #KoCizen
}

{ #category : #'meta data' }
ManifestKoCizen class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestKoCizen class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestKoCizen class >> rule50V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZBibCollectionBuilder'' selector: #queryForKozenTag: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) )
]

{ #category : #'meta data' }
ManifestKoCizen class >> rule8V1FalsePositive [
^ #(#('(RGClassDefinition named: #ManifestKoCizen)' #(#'15 March 2012' #'9:51:33 am')) )
]

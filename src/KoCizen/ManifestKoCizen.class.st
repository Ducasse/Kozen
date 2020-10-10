Class {
	#name : #ManifestKoCizen,
	#superclass : #Object,
	#category : #'KoCizen-Bib'
}

{ #category : #'meta data' }
ManifestKoCizen class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestKoCizen class >> rejectRules [
^ #('MethodHasNoTimeStampRule')
]

Class {
	#name : #ManifestKozen,
	#superclass : #Object,
	#category : #Kozen
}

{ #category : #'meta data' }
ManifestKozen class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestKozen class >> rejectRules [
^ #('MethodHasNoTimeStampRule')
]

{ #category : #'meta data' }
ManifestKozen class >> ruleUndeclaredReferenceRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#Citeseer #getCiteseerPage #false)) #'2012-11-29T14:48:51.453+00:00') )
]

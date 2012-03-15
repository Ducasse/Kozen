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
^ #(78 24 115)
]

{ #category : #'meta data' }
ManifestKozen class >> rule105V1TruePositive [
^ #(#('(RGMethodDefinition className: ''KZPage'' selector: #filename isMetaSide: false)' #(#'15 March 2012' #'9:14:12 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule108V1TruePositive [
^ #(#('(RGMethodDefinition className: ''KZVisitor'' selector: #visitItem: isMetaSide: false)' #(#'15 March 2012' #'9:36:38 am')) #('(RGMethodDefinition className: ''KZVisitor'' selector: #visitSection: isMetaSide: false)' #(#'15 March 2012' #'9:38:37 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule15V1FalsePositive [
^ #(#('(RGClassDefinition named: #KZVisitor)' #(#'15 March 2012' #'9:56:29 am')) #('(RGClassDefinition named: #KzMenuInfoBodySite)' #(#'15 March 2012' #'9:56:43 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule38V1TruePositive [
^ #(#('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #site isMetaSide: false)' #(#'15 March 2012' #'10:11:50 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule50V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZVisitor'' selector: #newFileFor: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) #('(RGMethodDefinition className: ''Citeseer'' selector: #getRankFrom:stoppingAt: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule76V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZPage'' selector: #head isMetaSide: false)' #(#'15 March 2012' #'10:03:20 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule8V1FalsePositive [
^ #(#('(RGClassDefinition named: #ManifestKozen)' #(#'15 March 2012' #'9:51:37 am')) #('(RGClassDefinition named: #KZResearchTopic)' #(#'15 March 2012' #'9:54:13 am')) )
]

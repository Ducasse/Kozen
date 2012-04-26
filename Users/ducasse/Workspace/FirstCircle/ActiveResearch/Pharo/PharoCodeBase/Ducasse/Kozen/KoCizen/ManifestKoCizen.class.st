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
^ #('InconsistentMethodClassificationRule' 'MethodHasNoTimeStampRule')
]

{ #category : #'meta data' }
ManifestKoCizen class >> rule50V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZBibCollectionBuilder'' selector: #queryForKozenTag: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) )
]

{ #category : #'meta data' }
ManifestKoCizen class >> rule8V1FalsePositive [
^ #(#('(RGClassDefinition named: #ManifestKoCizen)' #(#'15 March 2012' #'9:51:33 am')) )
]

{ #category : #'meta data' }
ManifestKoCizen class >> ruleImplementedNotSentRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZBibCollectionBuilder'' selector: #loadBib: isMetaSide: false)' #'2012-04-25T18:15:32.086000001+02:00') )
]

{ #category : #'meta data' }
ManifestKoCizen class >> ruleUtilityMethodsRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZBibCollectionBuilder'' selector: #queryForKozenTag: isMetaSide: false)' #'2012-04-25T18:21:34.006000001+02:00') )
]

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
^ #(78 24 'InconsistentMethodClassificationRule' 'LongMethodsRule' 115 'MethodHasNoTimeStampRule' 'TranslateLiteralsInMenusRule' 'MissingTranslationsInMenusRule')
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
ManifestKozen class >> rule17V1TODO [
^ #(#('(RGMethodDefinition className: ''String'' selector: #deDoubleSingleQuotes isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''StefSite'' selector: #bibBuilder: isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZVisitor'' selector: #endBody isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZObject'' selector: #siteId isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''StefSite'' selector: #keywordsText isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''StefSite class'' selector: #bibEntriesWithoutKzAnnotation isMetaSide: true)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZVisitor'' selector: #endBaliseCr: isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZObject'' selector: #siteId: isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''StefSite'' selector: #bibBuilder isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZSite'' selector: #addPage: isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) #('(RGMethodDefinition className: ''KZVisitor'' selector: #startBody isMetaSide: false)' #(#'22 March 2012' #'4:17:29 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule18V1TODO [
^ #(#('(RGClassDefinition named: #KZList)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZSite)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #Object)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZObject)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZPage)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZMenuItem)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZSection)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZLinkedImage)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #ProtoObject)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZDivBlock)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #StefSite)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZItem)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KZImage)' #(#'22 March 2012' #'4:18:06 pm')) #('(RGClassDefinition named: #KzMenuInfoBodySite)' #(#'22 March 2012' #'4:18:06 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule32V1TODO [
^ #(#('(RGClassDefinition named: #KZSection)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZRightBlock)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZObject)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZList)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZItem)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZImage)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZMenu)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZMenuItem)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZLinkedImage)' #(#'22 March 2012' #'4:26:45 pm')) #('(RGClassDefinition named: #KZResearchTopic)' #(#'22 March 2012' #'4:26:45 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule33V1TODO [
^ #(#('(RGClassDefinition named: #KZResearchTopic)' #(#'22 March 2012' #'4:27:15 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule38V1TruePositive [
^ #(#('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #site isMetaSide: false)' #(#'15 March 2012' #'10:11:50 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule50V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZVisitor'' selector: #newFileFor: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) #('(RGMethodDefinition className: ''Citeseer'' selector: #getRankFrom:stoppingAt: isMetaSide: false)' #(#'15 March 2012' #'10:17:16 am')) #('(RGMethodDefinition className: ''KZSite'' selector: #acceptVisitor: isMetaSide: false)' #(#'22 March 2012' #'4:30:17 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule71V1TODO [
^ #(#('(RGMethodDefinition className: ''KZVisitor'' selector: #visitPage: isMetaSide: false)' #(#'22 March 2012' #'4:17:08 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule76V1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZPage'' selector: #head isMetaSide: false)' #(#'15 March 2012' #'10:03:20 am')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule79V1TODO [
^ #(#('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #sectionCurrentJob isMetaSide: false)' #(#'22 March 2012' #'4:24:04 pm')) #('(RGMethodDefinition className: ''KZPage'' selector: #initialize isMetaSide: false)' #(#'22 March 2012' #'4:24:04 pm')) #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #sectionNews isMetaSide: false)' #(#'22 March 2012' #'4:24:04 pm')) #('(RGMethodDefinition className: ''Citeseer'' selector: #getCiteseerPage isMetaSide: false)' #(#'22 March 2012' #'4:24:04 pm')) #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #coordinatesBody isMetaSide: false)' #(#'22 March 2012' #'4:24:04 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule87V1TODO [
^ #(#('(RGMethodDefinition className: ''Citeseer'' selector: #getCiteseerPage isMetaSide: false)' #(#'22 March 2012' #'4:28:20 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> rule8V1FalsePositive [
^ #(#('(RGClassDefinition named: #ManifestKozen)' #(#'15 March 2012' #'9:51:37 am')) #('(RGClassDefinition named: #KZResearchTopic)' #(#'15 March 2012' #'9:54:13 am')) #('(RGClassDefinition named: #KZLinkedImage)' #(#'22 March 2012' #'4:14:45 pm')) )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleClassNotReferencedRuleV1FalsePositive [
^ #(#('(RGClassDefinition named: #KZResearchTopic)' #'2012-04-25T16:55:38.944+02:00') #('(RGClassDefinition named: #KZLinkedImage)' #'2012-04-25T16:55:39.044+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleExcessiveMethodsRuleV1FalsePositive [
^ #(#('(RGClassDefinition named: #KZVisitor)' #'2012-04-25T18:05:47.158000001+02:00') #('(RGClassDefinition named: #KzMenuInfoBodySite)' #'2012-04-25T18:05:47.169+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleImplementedNotSentRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZVisitor'' selector: #endBody isMetaSide: false)' #'2012-04-25T18:16:39.794000001+02:00') #('(RGMethodDefinition className: ''KZVisitor'' selector: #startBody isMetaSide: false)' #'2012-04-25T18:16:39.805+02:00') #('(RGMethodDefinition className: ''KZVisitor'' selector: #endBaliseCr: isMetaSide: false)' #'2012-04-25T18:16:39.814000001+02:00') #('(RGMethodDefinition className: ''KZObject'' selector: #siteId isMetaSide: false)' #'2012-04-25T18:16:39.828+02:00') #('(RGMethodDefinition className: ''KZObject'' selector: #siteId: isMetaSide: false)' #'2012-04-25T18:16:39.839000001+02:00') #('(RGMethodDefinition className: ''String'' selector: #deDoubleSingleQuotes isMetaSide: false)' #'2012-04-25T18:16:39.855000001+02:00') #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #bibBuilder isMetaSide: false)' #'2012-04-25T18:17:20.911+02:00') #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #bibBuilder: isMetaSide: false)' #'2012-04-25T18:17:20.934+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZPage'' selector: #name isMetaSide: false)' #'2012-04-25T18:17:44.609+02:00') #('(RGMethodDefinition className: ''KZImage'' selector: #acceptVisitor: isMetaSide: false)' #'2012-04-25T18:18:02.918+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleLawOfDemeterRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZPage'' selector: #head isMetaSide: false)' #'2012-04-25T18:19:32.836+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleMissingYourselfRuleV1TODO [
^ #(#('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #coordinatesBody isMetaSide: false)' #'2012-04-25T18:28:02.856+02:00') #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #sectionNews isMetaSide: false)' #'2012-04-25T18:28:02.916000001+02:00') #('(RGMethodDefinition className: ''Citeseer'' selector: #getCiteseerPage isMetaSide: false)' #'2012-04-25T18:28:02.934000001+02:00') #('(RGMethodDefinition className: ''KZPage'' selector: #initialize isMetaSide: false)' #'2012-04-25T18:28:02.986+02:00') #('(RGMethodDefinition className: ''KzMenuInfoBodySite'' selector: #publicationPage isMetaSide: false)' #'2012-04-25T18:28:03.007000001+02:00') )
]

{ #category : #'meta data' }
ManifestKozen class >> ruleUtilityMethodsRuleV1FalsePositive [
^ #(#('(RGMethodDefinition className: ''KZSite'' selector: #acceptVisitor: isMetaSide: false)' #'2012-04-25T18:21:33.990000001+02:00') #('(RGMethodDefinition className: ''Citeseer'' selector: #getRankFrom:stoppingAt: isMetaSide: false)' #'2012-04-25T18:21:34.015000001+02:00') #('(RGMethodDefinition className: ''KZVisitor'' selector: #newFileFor: isMetaSide: false)' #'2012-04-25T18:21:34.025000001+02:00') )
]

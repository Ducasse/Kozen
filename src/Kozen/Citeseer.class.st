"
Get the rank of someone in the Citeseer author's citation ranking (http://citeseerx.ist.psu.edu/stats/authors?all=true).

For example:

Citeseer rankOf: 'S. Ducasse'
"
Class {
	#name : #Citeseer,
	#superclass : #Object,
	#category : #Kozen
}

{ #category : #public }
Citeseer class >> rankOf: aName [
	"self rankOf: 'S. Ducasse'"
	^ self new rankOf: aName
]

{ #category : #operation }
Citeseer >> getCiteseerPage [
	^ ZnHttpClient new
		url: 'http://citeseerx.ist.psu.edu/stats/authors';
		parameterAt: 'all' put: 'true';
		get
]

{ #category : #operation }
Citeseer >> getRankFrom: page stoppingAt: aString [
	| count |
	count := 0.
	page
		regex: '<li>[[:space:]]*<span class="authors">[^>]+>([^<]+)'
		matchesDo: [:match | (match matchesRegex: ('.*', aString, '$'))
								ifTrue: [^ count + 1]
								ifFalse: [count := count + 1]].
	^ Error signal: aString, ' not found in page'
]

{ #category : #operation }
Citeseer >> rankOf: aName [
	| content rank |
	content := self getCiteseerPage.
	rank := self getRankFrom: content stoppingAt: aName.
	^ rank 
]

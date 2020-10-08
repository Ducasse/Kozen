Class {
	#name : #BaselineOfKozen,
	#superclass : #BaselineOf,
	#category : #BaselineOfKozen
}

{ #category : #baselines }
BaselineOfKozen >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		spec 
			baseline: 'Citezen' 
			with: [ spec repository: 'github://Ducasse/Citezen/src' ].
				
		spec package: 'Kozen'.
		spec package: 'KoCizen' with: [spec requires: 'Citezen'].
		spec package: 'KozStef' with: [spec requires: 'KoCizen']
		
		]
]

Class {
	#name : 'BaselineOfGToolkit4Matomo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGToolkit4Matomo',
	#package : 'BaselineOfGToolkit4Matomo'
}

{ #category : 'loading' }
BaselineOfGToolkit4Matomo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4matomo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : 'baseline' }
BaselineOfGToolkit4Matomo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GToolkit4Matomo'
		]
]

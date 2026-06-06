"
Examples for the Matomo API model.
"
Class {
	#name : 'MtAccountExamples',
	#superclass : 'TestCase',
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'examples' }
MtAccountExamples >> defaultAccount [
	<gtExample>
	<return: #MtAccount>
	| account |
	account := MtAccount default.
	self assert: (account version at: 'value') isString.
	^ account
]

{ #category : 'examples' }
MtAccountExamples >> defaultSiteVisitors [
	<gtExample>
	<return: #MtVisitors>
	| visitors |
	visitors := self defaultAccount sites first visitors.
	self assert: visitors size >= 0.
	^ visitors
]

{ #category : 'examples' }
MtAccountExamples >> defaultSiteVisits [
	<gtExample>
	<return: #MtVisits>
	| visits |
	visits := self defaultAccount sites first visits.
	self assert: visits size >= 0.
	^ visits
]

{ #category : 'examples' }
MtAccountExamples >> defaultVisit [
	<gtExample>
	<return: #MtVisit>
	| visits |
	visits := self defaultSiteVisits.
	self assert: visits isEmpty not.
	^ visits first
]

{ #category : 'examples' }
MtAccountExamples >> defaultVisitActions [
	<gtExample>
	<return: #MtVisitActions>
	| actions |
	actions := self defaultVisit actions.
	self assert: actions size >= 1.
	^ actions
]

{ #category : 'examples' }
MtAccountExamples >> defaultVisitor [
	<gtExample>
	<return: #MtVisitor>
	| visitors |
	visitors := self defaultSiteVisitors.
	self assert: visitors isEmpty not.
	^ visitors first
]

{ #category : 'examples' }
MtAccountExamples >> feenkGoals [
	<gtExample>
	<return: #MtGoals>
	| goals |
	goals := self feenkSite goals.
	self assert: goals size >= 1.
	^ goals
]

{ #category : 'examples' }
MtAccountExamples >> feenkSite [
	<gtExample>
	<return: #MtSite>
	| site |
	site := self sites items detect: [ :each | each name = 'feenk.com' ].
	self assert: site idSite = 2.
	^ site
]

{ #category : 'examples' }
MtAccountExamples >> goalsMetadata [
	<gtExample>
	<return: #Object>
	| metadata |
	metadata := self defaultAccount goalsMetadataForSiteId: self feenkSite idSite.
	self assert: metadata notNil.
	^ metadata
]

{ #category : 'examples' }
MtAccountExamples >> sites [
	<gtExample>
	<return: #MtSites>
	| sites |
	sites := self defaultAccount sites.
	self assert: sites isEmpty not.
	^ sites
]

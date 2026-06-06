"
I represent a Matomo tracked site.
"
Class {
	#name : 'MtSite',
	#superclass : 'MtEntity',
	#instVars : [
		'account'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'accessing' }
MtSite >> account [
	^ account
]

{ #category : 'accessing' }
MtSite >> account: anAccount [
	account := anAccount
]

{ #category : 'api' }
MtSite >> addGoalNamed: aName matchAttribute: aMatchAttribute pattern: aPattern patternType: aPatternType caseSensitive: aBoolean allowMultipleConversionsPerVisit: anotherBoolean revenue: aNumber [
	| data |
	data := self postAction: 'Goals.addGoal' arguments: {
		'idSite' -> self idSite.
		'name' -> aName.
		'matchAttribute' -> aMatchAttribute.
		'pattern' -> aPattern.
		'patternType' -> aPatternType.
		'caseSensitive' -> (aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]).
		'allowMultipleConversionsPerVisit' -> (anotherBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]).
		'revenue' -> aNumber }.
	^ data at: 'value'
]

{ #category : 'accessing' }
MtSite >> baseUrl [
	^ account baseUrl
]

{ #category : 'actions' }
MtSite >> deleteGoal: aGoal [
	^ self postAction: 'Goals.deleteGoal' arguments: {
		'idSite' -> self idSite.
		'idGoal' -> aGoal idGoal }
]

{ #category : 'api' }
MtSite >> goals [
	| data |
	data := self postAction: 'Goals.getGoals' arguments: { 'idSite' -> self idSite }.
	^ MtGoals new
		site: self;
		rawData: data;
		yourself
]

{ #category : 'gt views' }
MtSite >> gtDisplayOn: aStream [
	aStream nextPutAll: self name
]

{ #category : 'gt views' }
MtSite >> gtGoalsFor: aView [
	<gtView>
	^ aView forward
		title: 'Goals';
		priority: 40;
		object: [ self goals ];
		view: #gtItemsFor:
]

{ #category : 'gt views' }
MtSite >> gtVisitorsFor: aView [
	<gtView>
	^ aView forward
		title: 'Visitors';
		priority: 45;
		object: [ self visitors ];
		view: #gtItemsFor:
]

{ #category : 'gt views' }
MtSite >> gtVisitsFor: aView [
	<gtView>
	^ aView forward
		title: 'Visits';
		priority: 50;
		object: [ self visits ];
		view: #gtItemsFor:
]

{ #category : 'accessing' }
MtSite >> idSite [
	^ self at: 'idsite'
]

{ #category : 'accessing' }
MtSite >> mainUrl [
	^ self at: 'main_url' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtSite >> name [
	^ self at: 'name'
]

{ #category : 'accessing' }
MtSite >> token [
	^ account token
]

{ #category : 'api' }
MtSite >> visitors [
	^ MtVisitors new
		site: self;
		rawData: self visits items;
		yourself
]

{ #category : 'api' }
MtSite >> visits [
	| data |
	data := self postAction: 'Live.getLastVisitsDetails' arguments: {
		'idSite' -> self idSite.
		'period' -> 'day'.
		'date' -> 'today' }.
	^ MtVisits new
		site: self;
		rawData: data;
		yourself
]

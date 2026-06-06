"
I represent a collection of visitors for a Matomo site.
"
Class {
	#name : 'MtVisitors',
	#superclass : 'MtGroup',
	#instVars : [
		'site'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtVisitors >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Visitors';
		priority: 20;
		items: [ self items asSortedCollection: [ :a :b | a lastActionDateTime >= b lastActionDateTime ] ];
		column: 'Visitor' text: #visitorId width: 140;
		column: 'Visits' text: [ :each | each visitCount asString ] width: 60;
		column: 'Country' text: #country;
		column: 'IP' text: #visitIp width: 120;
		column: 'Last action' text: #lastActionDateTime weight: 2
]

{ #category : 'private' }
MtVisitors >> materializeItems [
	| grouped |
	grouped := Dictionary new.
	(rawData ifNil: [ #() ]) do: [ :eachVisit |
		(grouped at: eachVisit visitorId ifAbsentPut: [ OrderedCollection new ]) add: eachVisit ].
	^ grouped associations collect: [ :assoc |
		MtVisitor new
			site: site;
			visitorId: assoc key;
			visits: assoc value asArray;
			rawData: assoc value asArray;
			yourself ]
]

{ #category : 'accessing' }
MtVisitors >> site [
	^ site
]

{ #category : 'accessing' }
MtVisitors >> site: aSite [
	site := aSite
]

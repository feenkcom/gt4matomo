"
I represent the recent visits of a Matomo site.
"
Class {
	#name : 'MtVisits',
	#superclass : 'MtGroup',
	#instVars : [
		'site'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtVisits >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Visits';
		priority: 20;
		items: [ self items ];
		column: 'Visitor' text: #visitorId width: 140;
		column: 'IP' text: #visitIp width: 120;
		column: 'Country' text: #country;
		column: 'Visitor type' text: #visitorType;
		column: 'Actions' text: [ :each | each actionCount asString ] width: 70;
		column: 'Last action' text: #lastActionDateTime weight: 2
]

{ #category : 'private' }
MtVisits >> materializeItems [
	^ (rawData ifNil: [ #() ]) collect: [ :each |
		MtVisit new
			site: site;
			rawData: each;
			yourself ]
]

{ #category : 'accessing' }
MtVisits >> site [
	^ site
]

{ #category : 'accessing' }
MtVisits >> site: aSite [
	site := aSite
]

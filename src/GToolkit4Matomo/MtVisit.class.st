"
I represent a single Matomo visit.
"
Class {
	#name : 'MtVisit',
	#superclass : 'MtEntity',
	#instVars : [
		'site'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'accessing' }
MtVisit >> actionCount [
	^ self at: 'actions' ifAbsent: [ 0 ]
]

{ #category : 'accessing' }
MtVisit >> actions [
	^ MtVisitActions new
		visit: self;
		rawData: (self at: 'actionDetails' ifAbsent: [ #() ]);
		yourself
]

{ #category : 'accessing' }
MtVisit >> country [
	^ self at: 'country' ifAbsent: [ '' ]
]

{ #category : 'gt views' }
MtVisit >> gtActionsFor: aView [
	<gtView>
	^ aView forward
		title: 'Actions';
		priority: 30;
		object: [ self actions ];
		view: #gtItemsFor:
]

{ #category : 'gt views' }
MtVisit >> gtDisplayOn: aStream [
	aStream
		nextPutAll: self visitorId;
		nextPutAll: ' (';
		nextPutAll: self country;
		nextPutAll: ')'
]

{ #category : 'gt views' }
MtVisit >> gtSummaryFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Summary';
		priority: 10;
		items: [ {
			'Visitor id' -> self visitorId.
			'IP' -> self visitIp.
			'Country' -> self country.
			'Visitor type' -> self visitorType.
			'Actions' -> self actionCount.
			'Last action' -> self lastActionDateTime } ];
		column: 'Property' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value asString ]
]

{ #category : 'accessing' }
MtVisit >> lastActionDateTime [
	^ self at: 'lastActionDateTime' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisit >> site [
	^ site
]

{ #category : 'accessing' }
MtVisit >> site: aSite [
	site := aSite
]

{ #category : 'accessing' }
MtVisit >> visitIp [
	^ self at: 'visitIp' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisit >> visitorId [
	^ self at: 'visitorId' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisit >> visitorType [
	^ self at: 'visitorType' ifAbsent: [ '' ]
]

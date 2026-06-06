"
I represent a visitor together with the visits observed for that visitor.
"
Class {
	#name : 'MtVisitor',
	#superclass : 'MtEntity',
	#instVars : [
		'site',
		'visitorId',
		'visits'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'accessing' }
MtVisitor >> country [
	^ self visits ifEmpty: [ '' ] ifNotEmpty: [ self visits first country ]
]

{ #category : 'gt views' }
MtVisitor >> gtDisplayOn: aStream [
	aStream
		nextPutAll: self visitIp;
		nextPutAll: ' (';
		nextPutAll: self visitCount asString;
		nextPutAll: ' visits)'
]

{ #category : 'gt views' }
MtVisitor >> gtSummaryFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Summary';
		priority: 10;
		items: [ {
			'IP' -> self visitIp.
			'Visits' -> self visitCount.
			'Country' -> self country.
			'Last action' -> self lastActionDateTime } ];
		column: 'Property' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value asString ]
]

{ #category : 'gt views' }
MtVisitor >> gtVisitsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Visits';
		priority: 20;
		items: [ self visits ];
		column: 'IP' text: #visitIp width: 120;
		column: 'Country' text: #country;
		column: 'Visitor type' text: #visitorType;
		column: 'Actions' text: [ :each | each actionCount asString ] width: 70;
		column: 'Last action' text: #lastActionDateTime weight: 2
]

{ #category : 'accessing' }
MtVisitor >> lastActionDateTime [
	^ self visits ifEmpty: [ '' ] ifNotEmpty: [ (self visits asSortedCollection: [ :a :b | a lastActionDateTime >= b lastActionDateTime ]) first lastActionDateTime ]
]

{ #category : 'accessing' }
MtVisitor >> site [
	^ site
]

{ #category : 'accessing' }
MtVisitor >> site: aSite [
	site := aSite
]

{ #category : 'accessing' }
MtVisitor >> visitCount [
	^ self visits size
]

{ #category : 'accessing' }
MtVisitor >> visitIp [
	^ self visits ifEmpty: [ '' ] ifNotEmpty: [ self visits first visitIp ]
]

{ #category : 'accessing' }
MtVisitor >> visitorId [
	^ visitorId ifNil: [ self visitIp ]
]

{ #category : 'accessing' }
MtVisitor >> visitorId: aString [
	visitorId := aString
]

{ #category : 'accessing' }
MtVisitor >> visits [
	^ visits ifNil: [ #() ]
]

{ #category : 'accessing' }
MtVisitor >> visits: aCollection [
	visits := aCollection
]

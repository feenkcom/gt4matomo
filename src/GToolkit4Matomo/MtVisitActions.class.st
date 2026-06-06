"
I represent the action details nested in a Matomo visit.
"
Class {
	#name : 'MtVisitActions',
	#superclass : 'MtGroup',
	#instVars : [
		'visit'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtVisitActions >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Actions';
		priority: 20;
		items: [ self items ];
		column: 'Type' text: #type width: 80;
		column: 'Title' text: #title weight: 2;
		column: 'URL' text: #url weight: 3;
		column: 'Time' text: #serverTimePretty width: 80;
		column: 'Spent' text: #timeSpentPretty width: 80
]

{ #category : 'private' }
MtVisitActions >> materializeItems [
	^ (rawData ifNil: [ #() ]) collect: [ :each |
		MtVisitAction new
			visit: visit;
			rawData: each;
			yourself ]
]

{ #category : 'accessing' }
MtVisitActions >> visit [
	^ visit
]

{ #category : 'accessing' }
MtVisitActions >> visit: aVisit [
	visit := aVisit
]

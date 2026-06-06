"
I represent one action performed during a Matomo visit.
"
Class {
	#name : 'MtVisitAction',
	#superclass : 'MtEntity',
	#instVars : [
		'visit'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtVisitAction >> gtDisplayOn: aStream [
	aStream nextPutAll: self title
]

{ #category : 'accessing' }
MtVisitAction >> serverTimePretty [
	^ self at: 'serverTimePretty' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisitAction >> timeSpentPretty [
	^ self at: 'timeSpentPretty' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisitAction >> title [
	^ self at: 'title' ifAbsent: [ self at: 'pageTitle' ifAbsent: [ '' ] ]
]

{ #category : 'accessing' }
MtVisitAction >> type [
	^ self at: 'type' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisitAction >> url [
	^ self at: 'url' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtVisitAction >> visit [
	^ visit
]

{ #category : 'accessing' }
MtVisitAction >> visit: aVisit [
	visit := aVisit
]

"
I represent a Matomo analytic goal for a site.
"
Class {
	#name : 'MtGoal',
	#superclass : 'MtEntity',
	#instVars : [
		'site'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'actions' }
MtGoal >> delete [
	^ site deleteGoal: self
]

{ #category : 'accessing' }
MtGoal >> description [
	^ self at: 'description' ifAbsent: [ '' ]
]

{ #category : 'gt views' }
MtGoal >> gtDisplayOn: aStream [
	aStream nextPutAll: self name
]

{ #category : 'accessing' }
MtGoal >> idGoal [
	^ self at: 'idgoal'
]

{ #category : 'accessing' }
MtGoal >> isDeleted [
	^ (self at: 'deleted' ifAbsent: [ 0 ]) = 1
]

{ #category : 'accessing' }
MtGoal >> matchAttribute [
	^ self at: 'match_attribute' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtGoal >> name [
	^ self at: 'name'
]

{ #category : 'accessing' }
MtGoal >> pattern [
	^ self at: 'pattern' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtGoal >> patternType [
	^ self at: 'pattern_type' ifAbsent: [ '' ]
]

{ #category : 'accessing' }
MtGoal >> site [
	^ site
]

{ #category : 'accessing' }
MtGoal >> site: aSite [
	site := aSite
]

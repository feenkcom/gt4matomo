"
I represent the goals configured for a Matomo site.
"
Class {
	#name : 'MtGoals',
	#superclass : 'MtGroup',
	#instVars : [
		'site'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtGoals >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Goals';
		priority: 20;
		items: [ self items ];
		column: 'Id' text: [ :each | each idGoal asString ] width: 60;
		column: 'Name' text: #name;
		column: 'Match' text: #matchAttribute width: 100;
		column: 'Pattern type' text: #patternType width: 100;
		column: 'Pattern' text: #pattern weight: 2;
		column: 'Deleted' text: [ :each | each isDeleted ifTrue: [ 'yes' ] ifFalse: [ '' ] ] width: 70
]

{ #category : 'private' }
MtGoals >> materializeItems [
	^ (rawData ifNil: [ #() ]) collect: [ :each |
		MtGoal new
			site: site;
			rawData: each;
			yourself ]
]

{ #category : 'accessing' }
MtGoals >> site [
	^ site
]

{ #category : 'accessing' }
MtGoals >> site: aSite [
	site := aSite
]

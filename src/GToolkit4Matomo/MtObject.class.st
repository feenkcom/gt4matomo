"
I model a raw Matomo API object. Instances keep the decoded response dictionary or collection in rawData.
"
Class {
	#name : 'MtObject',
	#superclass : 'Object',
	#instVars : [
		'rawData'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'gt views' }
MtObject >> gtRawDataFor: aView [
	<gtView>
	^ aView forward
		title: 'Raw data';
		priority: 100;
		object: [ rawData ];
		view: #gtLiveFor:
]

{ #category : 'instance creation' }
MtObject >> initialize [
	super initialize.
	rawData := Dictionary new.
]

{ #category : 'accessing' }
MtObject >> rawData [
	^ rawData
]

{ #category : 'accessing' }
MtObject >> rawData: anObject [
	rawData := anObject
]

"
I represent a Matomo API collection backed by raw JSON data or already materialized items.
"
Class {
	#name : 'MtGroup',
	#superclass : 'MtObject',
	#instVars : [
		'items'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'accessing' }
MtGroup >> collect: aBlock [
	^ self items collect: aBlock
]

{ #category : 'accessing' }
MtGroup >> do: aBlock [
	^ self items do: aBlock
]

{ #category : 'accessing' }
MtGroup >> first [
	^ self items first
]

{ #category : 'gt views' }
MtGroup >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 20;
		items: [ self items ];
		column: 'Item' text: [ :each | each printString ]
]

{ #category : 'testing' }
MtGroup >> isEmpty [
	^ self items isEmpty
]

{ #category : 'accessing' }
MtGroup >> items [
	^ items ifNil: [ items := self materializeItems ]
]

{ #category : 'accessing' }
MtGroup >> items: aCollection [
	items := aCollection
]

{ #category : 'private' }
MtGroup >> materializeItems [
	^ rawData ifNil: [ #() ] ifNotNil: [ rawData ]
]

{ #category : 'accessing' }
MtGroup >> size [
	^ self items size
]

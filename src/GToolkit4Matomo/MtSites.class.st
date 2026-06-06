"
I represent a collection of Matomo sites.
"
Class {
	#name : 'MtSites',
	#superclass : 'MtGroup',
	#instVars : [
		'account'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'accessing' }
MtSites >> account [
	^ account
]

{ #category : 'accessing' }
MtSites >> account: anAccount [
	account := anAccount
]

{ #category : 'gt views' }
MtSites >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Sites';
		priority: 20;
		items: [ self items ];
		column: 'Id' text: [ :each | each idSite asString ] width: 60;
		column: 'Name' text: #name;
		column: 'Main URL' text: #mainUrl
]

{ #category : 'private' }
MtSites >> materializeItems [
	^ (rawData ifNil: [ #() ]) collect: [ :each |
		MtSite new
			account: self account;
			rawData: each;
			yourself ]
]

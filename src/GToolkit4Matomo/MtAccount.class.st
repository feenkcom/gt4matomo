"
I represent a Matomo account entry point. It exposes available sites and basic API metadata.
"
Class {
	#name : 'MtAccount',
	#superclass : 'MtEntity',
	#instVars : [
		'baseUrl',
		'token'
	],
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'instance creation' }
MtAccount class >> default [
	^ self new initializeFromDefaultTokenFile
]

{ #category : 'accessing' }
MtAccount >> baseUrl [
	^ baseUrl
]

{ #category : 'accessing' }
MtAccount >> baseUrl: aString [
	baseUrl := aString
]

{ #category : 'api' }
MtAccount >> goalsMetadataForSiteId: aSiteId [
	^ self postAction: 'API.getMetadata' arguments: {
		'apiModule' -> 'Goals'.
		'apiAction' -> 'getGoals'.
		'idSite' -> aSiteId }
]

{ #category : 'gt views' }
MtAccount >> gtSitesFor: aView [
	<gtView>
	^ aView forward
		title: 'Sites';
		priority: 30;
		object: [ self sites ];
		view: #gtItemsFor:
]

{ #category : 'gt views' }
MtAccount >> gtVersionFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Version';
		priority: 10;
		text: [ (self version at: 'value' ifAbsent: [ 'unknown' ]) asRopedText ]
]

{ #category : 'instance creation' }
MtAccount >> initialize [
	super initialize.
	baseUrl := 'https://feenk.matomo.cloud'.
]

{ #category : 'instance creation' }
MtAccount >> initializeFromDefaultTokenFile [
	token := (FileLocator home / '.secrets/matomo-token.txt') contents trimBoth.
	rawData := Dictionary new.
]

{ #category : 'api' }
MtAccount >> sites [
	| data |
	data := self postAction: 'SitesManager.getSitesWithAtLeastViewAccess' arguments: #().
	^ MtSites new
		account: self;
		rawData: data;
		yourself
]

{ #category : 'accessing' }
MtAccount >> token [
	^ token
]

{ #category : 'accessing' }
MtAccount >> token: aString [
	token := aString
]

{ #category : 'api' }
MtAccount >> version [
	^ self postAction: 'API.getMatomoVersion' arguments: #()
]

"
I represent a Matomo API entity backed by a dictionary. I know how to perform authenticated API calls and how to reify linked sub-resources.
"
Class {
	#name : 'MtEntity',
	#superclass : 'MtObject',
	#category : 'GToolkit4Matomo',
	#package : 'GToolkit4Matomo'
}

{ #category : 'private' }
MtEntity >> apiEndpoint [
	^ self baseUrl , '/index.php'
]

{ #category : 'accessing' }
MtEntity >> at: aKey [
	^ rawData at: aKey
]

{ #category : 'accessing' }
MtEntity >> at: aKey ifAbsent: aBlock [
	^ rawData at: aKey ifAbsent: aBlock
]

{ #category : 'private' }
MtEntity >> baseUrl [
	^ self subclassResponsibility
]

{ #category : 'private' }
MtEntity >> executeMethod: aMethodName arguments: anAssociationCollection [
	| client response |
	client := self newClientForMethod: aMethodName arguments: anAssociationCollection.
	client post.
	response := client response contents.
	^ STONJSON fromString: response
]

{ #category : 'private' }
MtEntity >> executeMethod: aMethodName arguments: anAssociationCollection ifError: anErrorBlock [
	| result |
	result := self executeMethod: aMethodName arguments: anAssociationCollection.
	((result isDictionary and: [ (result at: 'result' ifAbsent: [ nil ]) = 'error' ])
		or: [ result isDictionary and: [ result keys asSet = (Set with: 'result' with: 'message') and: [ (result at: 'result') = 'error' ] ] ])
		ifTrue: [ ^ anErrorBlock value: result ].
	^ result
]

{ #category : 'gt views' }
MtEntity >> gtPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 20;
		items: [ rawData associations ];
		column: 'Key' text: [ :assoc | assoc key asString ];
		column: 'Value' text: [ :assoc | assoc value printString ]
]

{ #category : 'private' }
MtEntity >> newClientForMethod: aMethodName arguments: anAssociationCollection [
	| client |
	client := ZnClient new.
	client url: self apiEndpoint.
	client queryAt: 'module' put: 'API'.
	client queryAt: 'method' put: aMethodName.
	client queryAt: 'format' put: 'JSON'.
	anAssociationCollection do: [ :assoc | client queryAt: assoc key put: assoc value asString ].
	client formAt: 'token_auth' put: self token.
	^ client
]

{ #category : 'private' }
MtEntity >> postAction: aMethodName arguments: anAssociationCollection [
	^ self executeMethod: aMethodName arguments: anAssociationCollection ifError: [ :error | self error: (error at: 'message' ifAbsent: [ error printString ]) ]
]

{ #category : 'private' }
MtEntity >> token [
	^ self subclassResponsibility
]

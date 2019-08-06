Class {
	#name : #TheBoil,
	#superclass : #Product,
	#instVars : [
		'TOG'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
TheBoil >> TOG [
	^ TOG
]

{ #category : #accessing }
TheBoil >> TOG: aNumber [
	TOG := aNumber
]

{ #category : #accessing }
TheBoil >> checkTOG: aDuration [
	aDuration >= 60
		ifTrue: [ TOG := 1.08 ]
		ifFalse: [ TOG := 1.1 ].
	^ TOG
]

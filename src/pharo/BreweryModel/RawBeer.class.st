Class {
	#name : #RawBeer,
	#superclass : #Product,
	#instVars : [
		'TFG'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
RawBeer >> TFG [
	^ TFG
]

{ #category : #accessing }
RawBeer >> TFG: aNumber [
	TFG := aNumber
]

{ #category : #accessing }
RawBeer >> checkTFG: aDuration [
	aDuration > 7
		ifTrue: [ TFG := 1.01 ]
		ifFalse: [ TFG := 1.03 ].
	^ TFG
]

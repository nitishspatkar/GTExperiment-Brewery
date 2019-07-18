Class {
	#name : #Beer,
	#superclass : #Product,
	#instVars : [
		'color',
		'alcoholContent',
		'taste'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Beer >> alcoholContent [
^ alcoholContent
]

{ #category : #accessing }
Beer >> alcoholContent: aNumber [
alcoholContent := aNumber
]

{ #category : #accessing }
Beer >> color [
^ color
]

{ #category : #accessing }
Beer >> color: aColor [
color := aColor
]

{ #category : #accessing }
Beer >> taste [
^ taste
]

{ #category : #accessing }
Beer >> taste: aString [
taste := aString
]

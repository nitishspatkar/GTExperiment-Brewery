Class {
	#name : #Grain,
	#superclass : #BrewingIngredient,
	#instVars : [
		'color'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Grain >> asElement [
<gtExample>
	^ BlElement new
		geometry: BlCircle new;
		size: 350 @ 100;
		background: Color transparent;
		border: (BlBorder paint: Color black width: 1);
		yourself
]

{ #category : #accessing }
Grain >> color [
^ color
]

{ #category : #accessing }
Grain >> color: aColor [
color := aColor
]

{ #category : #accessing }
Grain >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'Grain';
		stencil: [ self asElement ]
]

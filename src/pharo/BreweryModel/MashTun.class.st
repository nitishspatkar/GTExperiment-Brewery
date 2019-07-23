Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement |
	anElement := super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1).
		"when: BlClickEvent do: [self changeColor:anElement.]."
		^ anElement
]

{ #category : #accessing }
MashTun >> changeColor [
	| anElement |
	anElement := self asElement.
	anElement background: Color blue
]

{ #category : #accessing }
MashTun >> changeColor: anElement [
	anElement background: Color blue.
]

{ #category : #accessing }
MashTun >> clickOn: mashTun [
	| anElement |
	anElement := self asElement when: BlClickEvent do: [ self inform:'click' ]
]

{ #category : #accessing }
MashTun >> clickOnController: mashTun [
	| anElement |
	anElement := self asElement when: BlClickEvent do: [ self inform:'click' ]
]

{ #category : #accessing }
MashTun >> decisionController [
	state = 'finished'
		ifTrue: [ self changeColor]
		ifFalse: [self inform: 'Not enough consistency']
]

{ #category : #accessing }
MashTun >> finishMashing [
	state:= 'finished'
]

{ #category : #accessing }
MashTun >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'MashTun';
		stencil: [ self asElement ]
]

{ #category : #accessing }
MashTun >> initialize [
	super initialize.
	state := 'start'
]

{ #category : #accessing }
MashTun >> mash: grains with: water for: aDuration [
	| wort |
	wort := Wort new.
	wort checkConsistency: aDuration.
	wort consistency = 5
		ifTrue: [ self finishMashing ].
	^ wort
]

{ #category : #accessing }
MashTun >> mashTunOperationExample [
	<gtExample>
	| mashTun grains water wort |
	mashTun := MashTun new.
	grains := Grain new.
	water := Water new.
	mashTun mash: grains with: water for: 31.
	self decisionController.
	^ mashTun
]

{ #category : #accessing }
MashTun >> pickIngredients [
	<gtExample>
	| grains water |
	grains := Grain new type: 'American Barley'.
	water := Water new.
	^ {grains.
	water}
]

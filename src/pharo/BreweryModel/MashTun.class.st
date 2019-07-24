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
		border: (BlBorder paint: Color blue muchLighter width: 1);
		addChild: 
		(BrButton new 
		look: BrGlamorousButtonWithLabelLook; 
		label: self;
		action: [self startMashingCntrl. self clickOnCntrl: anElement ]).
	^ anElement
]

{ #category : #accessing }
MashTun >> changeColor: anElement [
	anElement background: Color blue.
]

{ #category : #accessing }
MashTun >> clickOnCntrl: anElement [
	"if mashing is complete then change the color"
	state = 'finished'
		ifTrue: [ self changeColor: anElement ]
		ifFalse: [self inform: 'Not enough consistency'].
	^ anElement
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
	"self decisionController."
	^ mashTun
]

{ #category : #accessing }
MashTun >> startMashingCntrl [
	self mash: 'grains' with: 'water' for: 11.
]

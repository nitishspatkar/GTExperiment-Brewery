Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state',
		'wort',
		'mashingDuration'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement editor1 calculatedSize |
	calculatedSize := self cntrlGetCapacity.
	editor1 := self newEditor text: 'Enter duration in minutes'.
	anElement := super asElement
		layout: BlLinearLayout horizontal;
		size: calculatedSize;
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1);
		addChild: editor1;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start mashing';
				action: [ | duration |
					duration := editor1 text asString asNumber.
					self cntrlStartMashing: duration.
					self cntrlCheckStatus: anElement ]).
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
MashTun >> cntrlStartMashing: duration [
	self mashWortFor: duration
]

{ #category : #accessing }
MashTun >> finishMashing [
	| wortConsistency |
	state:= 'finished'.
	^ [ wort ]
		ensure: [ wort := nil ]
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
	wort:= Wort new.
	state := 'start'
]

{ #category : #accessing }
MashTun >> mashWortFor: aDuration [
	"self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ]."

	self ingredients.
	(aDuration / 10) seconds wait.
	self wortConsistency: aDuration
]

{ #category : #accessing }
MashTun >> mashingDuraion [
	^ mashingDuration
]

{ #category : #accessing }
MashTun >> mashingDuraion: aNumber [
	mashingDuration := aNumber
]

{ #category : #accessing }
MashTun >> newEditor [
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		geometry: (BlRectangle cornerRadius: 4);
		background: Color white;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		padding: (BlInsets all: 3);
		hExact: 100;
		vFitContent;
		yourself
]

{ #category : #accessing }
MashTun >> state: aString [
	state := aString
]

{ #category : #accessing }
MashTun >> wortConsistency [
	"self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ]."

	^ wort consistency
]

{ #category : #accessing }
MashTun >> wortConsistency: aDuration [
	| wortConsistency |
	"self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ]."
	wortConsistency := wort checkConsistency: aDuration.
	wortConsistency = 5
		ifTrue: [ self finishMashing ].
]

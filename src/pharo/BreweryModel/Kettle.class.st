Class {
	#name : #Kettle,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state',
		'boil'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Kettle >> TOG [
	^ boil TOG
]

{ #category : #accessing }
Kettle >> addHops: someHops [
	self assert: [ boil isNotNil ].
	boil addHops: someHops
]

{ #category : #accessing }
Kettle >> addWort: aWort [
	self assert: [ boil isNil and: [ state = #start ] ].
	boil := TheBoil new.
	boil addWort: aWort
]

{ #category : #accessing }
Kettle >> asElement [
	<gtExample>
	| anElement editor1 editor2 editor3 calculatedSize|
	calculatedSize := self cntrlGetCapacity.
	editor1 := self newEditor text: 'Enter at duration'.
	editor2 := self newEditor text: 'Enter at duration'.
	editor3 := self newEditor text: 'Enter remaining duration'.
	anElement := super asElement
		size: calculatedSize;
		layout: BlLinearLayout horizontal;
		background: Color brown veryMuchLighter;
		border: (BlBorder paint: Color brown muchLighter width: 1);
		addChild: editor1;
		addChild: editor2;
		addChild: editor3;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start boiling';
				action: [ | duration1 duration2 remainignDuration finalDuration|
					duration1 := editor1 text asString asNumber.
					duration2 := editor2 text asString asNumber.
					remainignDuration := editor3 text asString asNumber.
					finalDuration = duration1 + (duration2 -duration1) + remainignDuration.
					[ (finalDuration / 10) seconds wait.
					self cntrlStartBoiling: finalDuration
					self clickOnCntrl: anElement ] fork ]).
	^ anElement
]

{ #category : #accessing }
Kettle >> boilFor: aDuration [
	self assert: [ boil isNotNil ].
	boil boilFor: aDuration
]

{ #category : #accessing }
Kettle >> boilHopesFor: aDuration [
	self ingredients removeAll.
	(aDuration / 10) seconds wait.
	self checkBoilTOG: aDuration
]

{ #category : #accessing }
Kettle >> changeColor: anElement [
	anElement background: Color brown.
]

{ #category : #accessing }
Kettle >> checkBoilTOG: aDuration [
	| boilTOG |
	boilTOG := boil
		checkTOG: aDuration boilTOG = 1.08
		ifTrue: [ self finishBoiling ]
]

{ #category : #accessing }
Kettle >> clickOnCntrl: anElement [
	"if boiling is complete then change the color"

	state = 'finished'
		ifTrue: [ self changeColor: anElement ]
		ifFalse: [ self inform: 'Too high TOG' ].
	^ anElement
]

{ #category : #accessing }
Kettle >> cntrlStartBoiling [
	self inform: 'OK'
]

{ #category : #accessing }
Kettle >> finishBoiling [
	state := 'finished'.
	^ boil
]

{ #category : #accessing }
Kettle >> initialize [
	super initialize.
	state := 'start'
]

{ #category : #accessing }
Kettle >> newEditor [
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
Kettle >> state: aString [
	state := aString
]

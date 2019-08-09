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
Kettle >> addHops: someHops [
self assert: [boil  isNotNil].
boil addHops: someHops
]

{ #category : #accessing }
Kettle >> addWort: aWort [
self assert: [boil  isNil and: [state = #start]].
boil := TheBoil new.
boil addWort: aWort.
]

{ #category : #accessing }
Kettle >> asElement [
	<gtExample>
	| anElement editor1 editor2 editor3 editor4 editor5 calculatedSize|
	calculatedSize := self cntrlGetCapacity.
	editor1 := self newEditor text: 'Enter Hopes 1'.
	editor2 := self newEditor text: 'Enter at duration'.
	editor3 := self newEditor text: 'Enter Hopes 2'.
	editor4 := self newEditor text: 'Enter at duration'.
	editor5 := self newEditor text: 'Enter remaining duration'.
	anElement := super asElement
		size: calculatedSize;
		layout: BlLinearLayout horizontal;
		background: Color brown veryMuchLighter;
		border: (BlBorder paint: Color brown muchLighter width: 1);
		"addChild: editor1;
		addChild: editor2;
		addChild: editor3;
		addChild: editor4;
		addChild: editor5;"
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start boiling';
				action: [ | hopes1 duration1 hopes2 duration2 duration |
					hopes1 := editor1 text asString.
					duration1 := editor2 text asString asNumber.
					hopes2 := editor3 text asString.
					duration2 := editor4 text asString asNumber.
					duration := editor5 text asString asNumber.
					[ (duration / 10) seconds wait.
					self cntrlStartBoiling: hopes1 at: duration1 and: hopes2 at: duration2 forAnother: duration.
					self clickOnCntrl: anElement ] fork ]).
	^ anElement
]

{ #category : #accessing }
Kettle >> boil: hopes1 at: duration1 and: hopes2 at: duration2 forAnother: remainingDuration in: wort [
	| theBoil totalDuration |
	theBoil := TheBoil new.
	totalDuration := duration1 + duration2 + remainingDuration.
	theBoil checkTOG: totalDuration.
	theBoil TOG <= 1.08
		ifTrue: [ self finishBoiling ].
	^ theBoil
]

{ #category : #accessing }
Kettle >> boilFor: aDuration [
self assert: [boil  isNotNil].
boil boilFor: aDuration
]

{ #category : #accessing }
Kettle >> changeColor: anElement [
	anElement background: Color brown.
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
Kettle >> cntrlStartBoiling: hopes1 at: duration1 and: hopes2 at: duration2 forAnother: duration in: wort [
	self boil: hopes1 at: duration1 and: hopes2 at: duration2 forAnother: duration in: wort
]

{ #category : #accessing }
Kettle >> finishBoiling [
	state := 'finished'
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
Kettle >> removeBoil [
	^ [ boil ]
		ensure: [ boil := nil ]
]

{ #category : #accessing }
Kettle >> state: aString [
	state := aString
]

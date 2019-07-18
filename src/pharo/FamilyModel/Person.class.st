Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'name',
		'father',
		'mother',
		'children'
	],
	#category : #FamilyModel
}

{ #category : #accessing }
Person >> asElement [
	^ BrLabel new
		look: BrGlamorousLabelLook;
		text: name;
		when: BlClickEvent do: [ :e | e target phlow spawnObject: self ];
		yourself
]

{ #category : #accessing }
Person >> children [
	^ children
]

{ #category : #accessing }
Person >> father [
	^ father
]

{ #category : #accessing }
Person >> father: aMan [
	father := aMan
]

{ #category : #accessing }
Person >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: name;
		stencil: [ self asElement ]
]

{ #category : #accessing }
Person >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #accessing }
Person >> mother [
	^ mother
]

{ #category : #accessing }
Person >> mother: aWoman [
	mother := aWoman
]

{ #category : #accessing }
Person >> name [
	^ name
]

{ #category : #accessing }
Person >> name: aString [
	name := aString
]

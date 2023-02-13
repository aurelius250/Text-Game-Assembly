; Author: Thomas Chor, Mark Aljehandro, Tony Maida
; Class: CIS123 Assembly Language
; File Name: Honey_Studios_Final_Group_Project.asm
; Creation Date: 12/2/21
; Program Description: Ironheart is text-based fantasy dungeon crawler where you take the role of Ironheart, an adventurer looking for a missing princess.

INCLUDE Irvine32.inc			;Use Irvine32 library.

.const
	;Declare constants here.

.data
	;Declare variables here.

	; TITLE ________________________________________________________________________________

	titleMenuText BYTE "Welcome to IronHeart! Created by Tony Maida, Thomas Chor, and Mark Alejandro.", 0 
	titleMenuText2 BYTE "It is the year 875 of the Imperial Calendar and Princess Viola of the Kingdom of Nasturtium has been kidnapped by a group of goblins.", 0
	titleMenuText3 BYTE "Unable to track down the goblins, the King calls upon you, a passing adventurer by the name of Ironheart, to find and rescue the princess.", 0
	titleMenuText4 BYTE "A week passed and you managed to find the goblins base in a cave deep in the mountains.", 0 

	; CLASS SELECTION __________________________________________________________________________________

	

	classPrompt BYTE "You have the option of three classes: Knight, Wizard, and Rogue.", 0 
	classDescription1 BYTE "(1) Knight: Clad in shiny armor, you are a proud warrior capable of sparing your foes.", 0
	classDescription2 BYTE "(2) Wizard: In robes of deep velvet, you are a master of the arcane arts capable of charming your foes with your magic.", 0
	classDescription3 BYTE "(3) Rogue: Covered by your black cloak, you are as silent as the grave capable of sneaking past your foes.", 0

	classPicking BYTE "Select your class: Knight (1), Wizard (2), and Rogue (3)", 0

	classResult1 BYTE "You have chosen the Knight. Wise choice! ", 0
	classResult2 BYTE "You have chosen the Wizard. Wise choice! ", 0
	classResult3 BYTE "You have chosen the Rogue. Wise choice! ", 0

	;_____________________________________________________________________________________________________
	
	;CLASS  

	currentClass DWORD 0 
	;How to use class values:
	;mov EAX, currentclass 
	;If currentClass value= 1(knight), 2(wizard), 3(rogue)
	; cmp EAX, 1

	; CAVE 1 __________________________________________________________________________________

	StoryCave1 BYTE "You stand before the entrance of the cave which houses the goblins you seek. Do you enter?", 0
	StoryAnswer1 BYTE "(1) Enter", 0
	StoryAnswer2 BYTE "(2) No", 0

	StoryExit BYTE "By not entering the cave do you give up on rescuing the Princess? (1) Yes   (2) No",0 

	StoryExit2 BYTE "You decide not to enter the cave." ,0
	StoryExit3 BYTE "You abandon your duties and leave the princess with the goblins.", 0
	StoryExit4 BYTE "One week later, the Kingdom of Nasturtium is destroyed by a mysterious, powerful entity.", 0

	StoryNotExit BYTE "No (Enter the cave.)", 0
	
	
	;_________________________________________________________________________________________________________

	Cave1Entrance1 BYTE "You enter the cave. You walk through a long tunnel and enter the first room, it is small and circular, damp and dark, lit up by a few torches embedded into walls.", 0
	Cave1Entrance2 BYTE "In the middle you find a goblin on the ground who appears to be sleeping. What do you do?", 0
	
	MenuText BYTE "Options: (1) Sneak past the goblin, (2) Physical Attack. ", 0 

	Cave1Answer1 BYTE "(1) Sneak past the goblin.", 0
	


	Cave1Answer2 BYTE "(2) Sneak Attack: Silently approaching, you easily and swiftly end the guard. He never stood a chance.", 0
	

	
	KnightAns1Cave1 BYTE "You try to sneak past the sleeping goblin but the sounds of your heavy armor wake the goblin up. It's time for combat", 0
	RogueAns1Cave1 BYTE "Quiet as a mouse, you attempt to sneak past the goblin.", 0
	WizardAns1Cave1 BYTE "You try to sneak past the sleeping goblin but you trip on your robe and, as you plummet to the ground, wake the goblin up. It's time for combat", 0

	SneakFailWizardPrompt BYTE "You are forced into mortal combat. The wizard has a plethora of spells, but these two are their best: (1) Magical Physical Attack, (2) Magical Spell ", 0
	SneakFailWizard BYTE "(1) Magical Physical Attack: You brandish your enchanted magical flaming elvish short sword and charge at the enemy. You slay it where it stands.", 0
	SneakFailWizard2 BYTE "(2) Forbidden Spell: Soveirgn Fireball. After a brief incantation, the room lights up with fire, and melts the monster in brutal fashion.", 0

	SneakFailKnightPrompt BYTE "You are forced into mortal combat. The knight is well trained and experienced. Their two best moves are: (1) Heart of Fire, (2) Heavenly Flurry", 0
	SneakFailKnight BYTE "Heart of fire: Gesturing to the heavens, the knight is buffed with an otherwordly powerup. The enemy charges at them, and they effortlessly counters with a strike, ending it swiftly.", 0
	SneakFailKnight2 BYTE "Heavenly Flurry: Calmly, the knight approaches the enemy, and then erupts in a ravagingly combination of attacks which completely overwhelms the enemy. It falls the ground.", 0

	RogueSneakSuccess BYTE "You successfully sneak past the goblin.",0
	RogueCombatPrompt db "You are forced into mortal combat. The Rogue is agile and elusive. Their best moves are: (1) Backstab, (2) Full Counter", 0
	RogueAttack1 db "Backstab: You hide and wait for the enemy to make a mistake. It doesn't take long and you approach him silently from behind and fiercely dig your serrated dirk straight into his neck, swiftly ending any hostilities.",0
	RogueAttack2 db "Full Counter: Waiting for the enemy to strike first, you use your size and speed advantage wisely, evading their telegraphed swing and swiftly sticking a 6 inch Damascan Steel into his carotid artery, summarily ending any hostilities.",0
	;__________________________________________________________________________________________________________

	; CAVE 2 __________________________________________________________________________________
	Cave2Enter1 db "As you walk deeper into the cave, you see a bright light in the distance and can hear a deep, booming voice in the middle of what seems like a chant.",0
	Cave2Enter2 db "You sprint ahead and enter the final room where you see a large hobgoblin holding up a sword in one hand and a large, black knife in the other with an unconscious woman strapped to a stone table to their right.",0
	Cave2Enter3 db "On the ground surrounding the table are magic runes placed in an intricate design with each rune glowing a deep crimson.",0
	Cave2End1 db "With the hobgoblin defeated you move to the stone table and check to see if the princess is injured, Fortunately, she seems to be unharmed.",0 
	Cave2End2 db "You undo the binding trapping her to the stone table and carefully carry her out of the cave. After a long trip out of the mountains, you eventually make it back to the King and return Princess Viola.",0
	GameEnd db "Congratulations, you saved the princess!",0
	Cave2Option1 db "1. Attack the hobgoblin", 0
	Cave2Option2 db "2. Speak to the hobgoblin", 0
	HgDialogue db  "So you've found us have you? Well it's too late! Once I kill you I'll sacrifice the princess to summon the Great Demon and lay waste to Nasturtium!",0
	;__________________________________________________________________________________________


.code
main PROC
	;Write your code here.
	
	pushad

	mov EDX, OFFSET titleMenuText
	call Crlf
	call WriteString
	call CountCrlf
	popad

	pushad
	mov EDX, OFFSET titleMenuText2
	call Crlf
	call WriteString
	call Crlf
	popad
	
	pushad
	mov EDX, OFFSET titleMenuText3
	call Crlf
	call WriteString
	call Crlf
	popad

	pushad
	mov EDX, OFFSET titleMenuText4
	call Crlf
	call WriteString
	call Crlf
	popad

	; Class Selection _________________________________________________________________________________________________________________________

	pushad 
	call CountCrlf
	mov EDX, OFFSET classPrompt
	call CountCrlf
	call Crlf
	call WriteString 

	pushad 
	call Crlf
	mov EDX, OFFSET classDescription1
	call Crlf
	call WriteString 

	pushad
	call Crlf
	mov EDX, OFFSET classDescription2
	call Crlf
	call WriteString 

	pushad
	call Crlf
	mov EDX, OFFSET classDescription3
	call Crlf
	call WriteString 
	call Crlf

	pushad 
	call CountCrlf
	mov EDX, OFFSET classPicking
	call Crlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call ReadDec ; Reads user input into EAX
	
	CMP EAX, 1
	JZ L11 

	CMP EAX, 2 
	JZ L12

	CMP EAX, 3
	JZ L13

	L11: pushad
	mov EDX, OFFSET classResult1
	call CountCrlf
	call WriteString 
	call CountCrlf
	mov currentClass, 1 
	popad

	JMP L8

	L8: JMP L9

	L12: pushad
	mov EDX, OFFSET classResult2
	call CountCrlf
	call WriteString 
	call CountCrlf
	mov currentClass, 2 
	popad
	
	L9: JMP L10
	
	L13:pushad
	mov EDX, OFFSET classResult3
	call CountCrlf
	call WriteString 
	call CountCrlf
	mov currentClass, 3 
	popad

	L10: 

	; Story Cave 1 _______________________________________________________________________________________________________

	pushad
	call CountCrlf
	mov EDX, OFFSET StoryCave1
	call CountCrlf
	call WriteString ; Reads string from EDX 
	

	call CountCrlf
	mov EDX, OFFSET StoryAnswer1
	call CountCrlf
	call WriteString ; Reads string from EDX 

	call Crlf
	mov EDX, OFFSET StoryAnswer2
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call ReadDec ; Reads user input into EAX

	CMP EAX, 1
	JZ L23

	CMP EAX, 2 
	JZ L21

	

	L21: 
	call Crlf
	mov EDX, OFFSET StoryExit
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call ReadDec 


	CMP EAX, 1
	JZ L31 

	CMP EAX, 2 
	JZ L32 


	L31: 

	call Crlf
	mov EDX, OFFSET StoryExit2
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	mov EDX, OFFSET StoryExit3
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	mov EDX, OFFSET StoryExit4
	call Crlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call CountCrlf
	JMP GameExit

	L32: 
	call Crlf
	mov EDX, OFFSET StoryNotExit 
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L23 


	
	L23: 
	popad
	;Action Cave 1 _______________________________________________________________________________________________________________

	call Crlf
	mov EDX, OFFSET Cave1Entrance1
	call Crlf
	call WriteString
	call Crlf

	mov EDX, OFFSET Cave1Entrance2
	call Crlf
	call WriteString 
	
	call Crlf

	mov EDX, OFFSET MenuText
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec ; Reads user input into EAX

	CMP EAX, 1
	JZ L1 

	CMP EAX, 2 
	JZ L2
	
	 
	L1: 
	pushad 
	mov EAX, currentclass 

	CMP EAX, 1
	JZ L41 

	CMP EAX, 2 
	JZ L42 

	CMP EAX, 3 
	JZ L43


	L41: 

	pushad
	mov EDX, OFFSET KnightAns1Cave1
	call Crlf
	call WriteString 
	call Crlf
	popad 
	JMP LSneakFailKnight

	JMP L91

	L91:
	JMP L92 


	L42: 

	pushad
	mov EDX, OFFSET WizardAns1Cave1
	call Crlf
	call WriteString 
	call Crlf
	JMP LSneakFailWizard
	popad 

	L43: 

	pushad
	mov EDX, OFFSET RogueAns1Cave1
	call Crlf
	call WriteString 
	call Crlf
	popad 
	JMP LSneak

	L92: 
	JMP L5

	L2: 
	mov EDX, OFFSET Cave1Answer2
	call Crlf
	call WriteString 
	call Crlf
	JMP L5

	LSneakFail: 

	pushad 
	mov EAX, currentClass 

	CMP Eax, 1 
	JZ LSneakFailKnight

	CMP Eax, 2 
	JZ LSneakFailWizard

	LSneakFailKnight: 

	pushad
	mov EDX, OFFSET SneakFailKnightPrompt
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec ;
	CMP EAX, 1 
	JZ LSneakFailKnightAttack1 
	CMP EAX, 2 
	JZ LSneakFailKnightAttack2 

	LSneakFailKnightAttack1: 
	pushad 
	mov EDX, OFFSET SneakFailKnight
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L5 

	LSneakFailKnightAttack2: 
	pushad 
	mov EDX, OFFSET SneakFailKnight2
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L5


	LSneakFailWizard: 

	pushad 
	mov EDX, OFFSET SneakFailWizardPrompt
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec 

	CMP EAX, 1 
	JZ LSneakFailWizardAttack1 

	CMP EAX, 2 
	JZ LSneakFailWizardAttack2 
	
	LSneakFailWizardAttack1: 

	pushad 
	mov EDX, OFFSET SneakFailWizard
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L5 

	LSneakFailWizardAttack2:  

	pushad 
	mov EDX, OFFSET SneakFailWizard2
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L5 

	LSneak:
	pushad 
	mov EDX, OFFSET RogueSneakSuccess
	call Crlf
	call WriteString 
	call Crlf
	popad 
	JMP LCave2

	L5: 

	; Story Cave 2_______________________________________________________________________________________________________________
	LCave2:
	call Crlf
	mov edx, OFFSET Cave2Enter1
	call WriteString
	call Crlf
	mov edx, OFFSET Cave2Enter2
	call WriteString	
	call Crlf
	mov edx, OFFSET Cave2Enter3
	call WriteString
	call Crlf


	call Crlf
	mov EDX, OFFSET Cave2Option1
	call CountCrlf
	call WriteString ; Reads string from EDX 

	call Crlf
	mov EDX, OFFSET Cave2Option2
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call ReadDec ; Reads user input into EAX

	CMP EAX, 1
	JZ L001

	CMP EAX, 2 
	JZ L002

	

	L001: 
	JMP L0011

	L002:
	call Crlf
	mov EDX, OFFSET HgDialogue
	call CountCrlf
	call WriteString ; Reads string from EDX 
	call CountCrlf
	call ReadDec 
	JMP L0011

	;Action Cave 2 _______________________________________________________________________________________________________________

	L0011:

	LCheck: 
	pushad 
	mov EAX, currentclass 

	CMP EAX, 1
	JZ L411 

	CMP EAX, 2 
	JZ L422 

	CMP EAX, 3 
	JZ L433


	L411: 

	pushad
	call Crlf
	popad 
	JMP LSneakFailKnight2

	JMP L93

	L93:
	JMP L94 


	L422: 

	pushad
	call Crlf
	JMP LSneakFailWizard2
	popad 

	L433: 

	pushad
	call Crlf
	popad 
	JMP LSneak2


	L94: 
	JMP L003


	LSneakFail2: 

	pushad 
	mov EAX, currentClass 

	CMP Eax, 1 
	JZ LSneakFailKnight2

	CMP Eax, 2 
	JZ LSneakFailWizard2

	CMP Eax, 3
	JZ LSneak2

	LSneakFailKnight2: 

	pushad
	mov EDX, OFFSET SneakFailKnightPrompt
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec ;
	CMP EAX, 1 
	JZ LSneakFailKnightAttack11 
	CMP EAX, 2 
	JZ LSneakFailKnightAttack22 

	LSneakFailKnightAttack11: 
	pushad 
	mov EDX, OFFSET SneakFailKnight
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003 

	LSneakFailKnightAttack22: 
	pushad 
	mov EDX, OFFSET SneakFailKnight2
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003


	LSneakFailWizard2: 

	pushad 
	mov EDX, OFFSET SneakFailWizardPrompt
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec 

	CMP EAX, 1 
	JZ LSneakFailWizardAttack11 

	CMP EAX, 2 
	JZ LSneakFailWizardAttack22 
	
	LSneakFailWizardAttack11: 

	pushad 
	mov EDX, OFFSET SneakFailWizard
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003 

	LSneakFailWizardAttack22: 

	pushad 
	mov EDX, OFFSET SneakFailWizard2
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003 

	LSneak2:
	pushad 
	mov EDX, OFFSET RogueCombatPrompt
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	call ReadDec 

	CMP EAX, 1 
	JZ LSneak11 

	CMP EAX, 2 
	JZ LSneak22 
	
	LSneak11: 

	pushad 
	mov EDX, OFFSET RogueAttack1
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003 

	LSneak22: 

	pushad 
	mov EDX, OFFSET RogueAttack2
	call Crlf
	call WriteString ; Reads string from EDX 
	call Crlf
	JMP L003 

	; Story Cave 2 Part 2_______________________________________________________________________________________________________________

	L003:
	call Crlf
	mov edx, OFFSET Cave2End1
	call WriteString
	call Crlf
	mov edx, OFFSET Cave2End2
	call WriteString
	call CountCrlf
	mov edx, OFFSET GameEnd
	call WriteString
	call Crlf

	GameExit: 
	exit						;Exit program.
main ENDP

	;Procedures go here.

	CountCrlf PROC
	pushad
	call crlf
	call crlf
	popad
	ret
	CountCrlf ENDP

END main
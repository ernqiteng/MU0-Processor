; ENGINEERING LAB 4
; Updated December 2025
; By Ern Qi Teng
; creates a game where the user has to dodge the boxes coming towards them
; if they collide with a box, they lose
; there are 10 boxes to dodge
; if the user is successful at dodging all 10 boxes, they win

;add sounds and lights

ORG &0000
;------------------------------------------DISPLAY RESET-----------------------------------------
reset
;reset display, set all to 0
LDA zero
STA digit0
LDA zero
STA digit1
LDA zero
STA digit2
LDA zero
STA digit3
LDA zero
STA digit4
LDA zero
STA digit5

LDA amber
STA trafficlights

LDA dash
STA digit5
LDA s
STA digit4
LDA t
STA digit3
LDA a
STA digit2
LDA r
STA digit1
LDA t
STA digit0

start
LDA buttons
SUB one
JNE start

LDA zero
STA digit0
LDA zero
STA digit1
LDA zero
STA digit2
LDA zero
STA digit3
LDA zero
STA digit4
LDA zero
STA digit5

;displays dinosaur
LDA zero
STA dino ;flag for where dino is
LDA dinodown
STA digit5

;---------------------------------------------COUNTDOWN-----------------------------------------------
;displays 3
LDA display3
STA digit0

countdowndelay
    LDA delay
    countdownloop
    SUB one
    JNE countdownloop

    LDA currentdelaycount
    SUB one
    STA currentdelaycount
    JNE countdowndelay

LDA delaycount
STA currentdelaycount

;displays 2
LDA display2
STA digit0

countdowndelay2
    LDA delay
    countdownloop2
    SUB one
    JNE countdownloop2

    LDA currentdelaycount
    SUB one
    STA currentdelaycount
    JNE countdowndelay2

LDA delaycount
STA currentdelaycount

;displays 1
LDA display1
STA digit0

countdowndelay3
    LDA delay
    countdownloop3
    SUB one
    JNE countdownloop3

    LDA currentdelaycount
    SUB one
    STA currentdelaycount
    JNE countdowndelay3

LDA delaycount
STA currentdelaycount

;--------------------------------------------BOXES--------------------------------------------

LDA score
ADD one
STA score

;displays first box
LDA boxdown
STA digit0

startdelay
    LDA delay
    loop
    SUB one
    JNE loop

    LDA currentdelaycount
    SUB one
    STA currentdelaycount
    JNE startdelay

LDA delaycount
STA currentdelaycount

;check if the dino needs to be moved
;checks if the 1 has been pressed
LDA keypad
SUB three
JGE moveboxes ;neither button pressed so don't need to move dino, jump to moving boxes
ADD one
JNE movedinoup ;if it is 0, 1 was pressed

;else move dino down
LDA zero
STA dino ;flag for where dino is
LDA dinodown
STA digit5
JMP moveboxes

movedinoup
LDA one
STA dino
LDA dinoup
STA digit5

moveboxes
;move boxes down
LDA digit3
STA digit4
LDA digit2
STA digit3
LDA digit1
STA digit2
LDA digit0
STA digit1
LDA zero
STA digit0

LDA currentboxcount
SUB one
STA currentboxcount
JNE startdelay

LDA boxcount
STA currentboxcount

;-----------------------------------------------------when box reaches dino--------------------------------------

startdelay2
    LDA delay
    loop2
    SUB one
    JNE loop2

    LDA currentdelaycount
    SUB one
    STA currentdelaycount
    JNE startdelay2

LDA delaycount
STA currentdelaycount

checkforloss
    LDA digit4
    SUB one
    SUB boxdown
    JGE checkifdinoup;box is up
    ;else box is down so we check if the dino is down
    LDA dino
    JNE nextbox ;if the dino is 1, then we continue
    JMP lose ;otherwise we lose

checkifdinoup
    ;the box is up so we check if the dino is up
    LDA dino
    JNE lose ;if it is 1, lose

;---------------------------------------------DISPLAYS NEXT BOX--------------------------------------------------

nextbox

LDA score
ADD one
STA score

; calculates which is the next box
    LDA score
    SUB ten 
    JGE tenthbox
    SUB one
    JGE ninthbox
    SUB one
    JGE eighthbox
    SUB one
    JGE seventhbox
    SUB one
    JGE sixthbox
    SUB one
    JGE fifthbox
    SUB one
    JGE fourthbox
    SUB one
    JGE thirdbox
    SUB one
    JGE secondbox

secondbox
    LDA boxup
    JMP displaynextbox
thirdbox
    LDA boxdown
    JMP displaynextbox
fourthbox
    LDA boxdown
    JMP displaynextbox
fifthbox
    LDA boxup
    JMP displaynextbox
sixthbox
    LDA boxdown
    JMP displaynextbox
seventhbox
    LDA boxdown
    JMP displaynextbox
eighthbox
    LDA boxup
    JMP displaynextbox
ninthbox
    LDA boxup
    JMP displaynextbox
tenthbox
    LDA boxdown

displaynextbox
    STA digit0
    JMP startdelay

;----------------------------------------------------END OF GAME--------------------------------------------------------

win ;displays win
    LDA zero
    STA digit0
    LDA zero
    STA digit1
    LDA zero
    STA digit2
    LDA zero
    STA digit3
    LDA zero
    STA digit4
    LDA zero
    STA digit5
    LDA dash
    STA digit5
    LDA dash
    STA digit4
    LDA dash
    STA digit0
    LDA w
    STA digit3
    LDA i
    STA digit2
    LDA n
    STA digit1

    LDA green
    STA trafficlights

    JMP endofgame

lose ;displays lose

    LDA red
    STA trafficlights

    LDA zero
    STA digit0
    LDA zero
    STA digit1
    LDA zero
    STA digit2
    LDA zero
    STA digit3
    LDA zero
    STA digit4
    LDA zero
    STA digit5

    LDA l
    STA digit5
    LDA o
    STA digit4
    LDA s
    STA digit3
    LDA e
    STA digit2
    LDA dash
    STA digit1

    ;displaying score
    LDA score
    SUB ten
    JGE score9
    SUB one
    JGE score8
    SUB one
    JGE score7
    SUB one
    JGE score6
    SUB one
    JGE score5
    SUB one
    JGE score4
    SUB one
    JGE score3
    SUB one
    JGE score2
    SUB one
    JGE score1
    JMP score0

score0
    LDA display0
    JMP printscore
score1
    LDA display1
    JMP printscore
score2
    LDA display2
    JMP printscore
score3
    LDA display3
    JMP printscore
score4
    LDA display4
    JMP printscore
score5
    LDA display5
    JMP printscore
score6
    LDA display6
    JMP printscore
score7
    LDA display7
    JMP printscore
score8
    LDA display8
    JMP printscore
score9
    LDA display9
    JMP printscore

printscore
    ;STA digit0
    LDA dash
    STA digit0

endofgame
    LDA buttons
    SUB two
    JNE endofgame

JMP reset

STP

;-----------------------------------------DEFINITIONS------------------------------------------
digit0 EQU &0FF5
digit1 EQU &0FF6
digit2 EQU &0FF7
digit3 EQU &0FF8
digit4 EQU &0FF9
digit5 EQU &0FFA
buttons EQU &FF0
keypad EQU &FF2
trafficlights EQU &FFF

red DEFW 0b0000010010001100
amber DEFW 0b0000001001000010
green DEFW 0b0000000100110001

w DEFW 0b001000000111110
i DEFW 0b001001000001001
n DEFW 0b010000100110110
dash DEFW 0b000000011000000

l DEFW 0b000000000111000
o DEFW 0b000000000111111
s DEFW 0b000000011101101
e DEFW 0b000000011111001

t DEFW 0b001001000000001
a DEFW 0b000000011110111
r DEFW 0b010000011110011

dinodown DEFW 0b000000000000100
dinoup DEFW 0b000000000000010
boxdown DEFW 0b000000011011100
boxup DEFW 0b000000011100011
dino DEFW 0b000000000000000 ;status of the dino

delay DEFW &FFFF
zero DEFW 0b000000000000000
one DEFW &0001
two DEFW &0002
three DEFW &0003
four DEFW &0004
five DEFW &0005
six DEFW &0006
seven DEFW &0007
eight DEFW &0008
nine DEFW &0009
ten DEFW &000A

display0 DEFW 0b000000000111111
display1 DEFW 0b000010000000110
display2 DEFW 0b000000011011011
display3 DEFW 0b000000011001111
display4 DEFW 0b000000011100110
display5 DEFW 0b000000011101101
display6 DEFW 0b000000011111101
display7 DEFW 0b000000000000111
display8 DEFW 0b000000011111111
display9 DEFW 0b000000011101111

score DEFW &0000
delaycount DEFW &0008
currentdelaycount DEFW &0008
boxcount DEFW &0005
currentboxcount DEFW &0005
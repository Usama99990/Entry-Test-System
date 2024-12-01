
INCLUDE irvine32.inc

.data
buffersize=20     ;; buffer size is the maximum lenghthof name and id 
total byte ?      ;;total contain the total number of data in data.txt file in starting byte
dupname byte buffersize dup(?)                   ;;dupname(current student name) is used to take the input name from the student used to mov string from dupname to 2d all names
dupid byte buffersize dup(?)                     ;;dupid(duplicate id ) is used to take the input id from the student and used to move the id string from dupid to 2d all ids
marks byte ?                                     ;;
allnames byte buffersize dup(buffersize dup(?))  ;; all names is used to contain all the names of the students appeared in exam
allids byte buffersize dup(buffersize dup(?))    ;; all ids used to contain all the ids of the student appeared in exam
allmarks byte buffersize dup(?)                  ;; all marks is used to contain the total marks obtained by the student in examination
fh dword ?                                       ;; fh is file handle
datafile byte "data.txt",0                       ;; data file contain name  id and score of the student  
r dword ?                                        ;; r represent row in procedures
sc byte ?
index1 dword ?
index2 dword ? 
n1 byte ?
n2 byte ?
r1 dword ?
r2 dword ?                                    
;;
;;
;;
papername byte "english.txt",0                  ;; paper name is the name of the file which contain the question paper from the file 
paperkey byte"key.txt",0                        ;; paper key is the name of the file which contains the name of answers key of the paper
fp dword ?                                      ;; fp is file pointer 
qsize=100                                       ;;  qsize is the constant expression which represents the maximum length of the question and choices
question byte 10 dup(qsize dup(?))              ;; question is the 2d array which contains the all questions from the question paper having maximum question 10
choice1 byte 10 dup(qsize dup(?))               ;; choice1 is the choice given with the question in mcqs   
choice2 byte 10 dup(qsize dup(?))               ;; choice2 is the choice no 2 given in the paper with questions 

dupques byte qsize dup(?)                       ;; dupques (duplicate question) is the array which is used to take input from the user for while designing the paper and other question writing and moving
c1 byte qsize dup(?)                            ;;c1 (duplicate choice 1) is the array which has function same as dupques
c2 byte qsize dup(?)                            ;;c2 // //  /// /  / // / / / / // /  / // / / / / / / // / / / // / / /
num dword ?                                     ;; number obtained by the student in the test
noofques=10                                      ;; constant no of questions in an exam 
anskey byte noofques dup(?),0                   ;; anskey  array which is used to contain the answers of the paper
kip byte 5 dup(?)                               ;; kip is used to take input from the user mostly the answer 'a' 'b' and so on
takeanswer  byte noofques dup(?),0              ;; this take array contains the given answers of question by the user (student)
randarray byte noofques dup(?) 
duplicateflag byte ? 

;;procedure copy from file is designed to read the file of paper and anser key set by the admin 
;;,and it is also used to conduct the paper from the student, the entity of this function according to the declared data is right below
;; papername ==paper
;; fp==filepointer 
;; question==ques
;;choice1==ch1
;;choice2==ch2
;;num==right
;;dupques==quesdup
;;c1==choise1
;;c2==choise2
;;anskey==array
;;paperkey==keyname
;;kip ==sk
;;takeanswer==ans
iqser1 dword 10 dup(?)               ;; iq generation series1
iqser2 dword 10 dup(?)               ;; iq generation series2
lum1 dword ?                         ;; iq comp
lum2 dword ?                         ;; iq compp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;interface variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





start byte "                                *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*",0
start1 byte "                                $                  WELCOME TO                         $",0
start2 byte "                                *    NATIONAL     UNIVERSITY     TESTING  SYSTEM      *",0
start3 byte "                                $*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$",0
start4 byte "                                ",0
admin_panel byte"press 1 if you want to enter admin panel",0
candidate_panel byte"press 2 if you want to enter candidate panel",0


a  byte"press 1 if you want to design the paper",0
a1 byte "press 2 if you want to update the paper",0
a2 byte"press 3 if you want ot view the results of the students ",0
a3 byte"press 5 if you want to exit",0
a4 byte "enter the next question you want to enter ",0
a5 byte "enter the choice 1 of your MCQ",0Dh,0Ah,0
a6 byte "enter the choice 2 of your MCQ",0Dh,0Ah,0
a7 byte "enter the question no  you want to change ",0Dh,0Ah,0

a8 byte "NAME",0
a9 byte "NU-ID",0
a10 byte "OBTAINED MARKS",0
a11 byte "enter the answer of the questions in sequenctial order ",0
a12 byte "enter 4 if you wnat to examin (view the paper) ",0



s byte "enter you full name",0
s1 byte "enter your NU given ID",0
s2 byte "enter key if you want to start your paper",0
s3 byte "enter your answer in 'a' or 'b'",0
s4 byte "number of right answers from above paper",0
s5 byte "press any key to start the IQ test ",0
s6 byte "answer the given series ",0
s7 byte "what will be the next element in this series",0
spa byte "    ",0
s9 byte "if these charachters are equal to ",0
s10 byte "these numbers ",0
s11 byte "than what will be the values of these charachters",0
s12 byte "if the following characters are consider to be encrypted using shiftcipher ",0
s13 byte "which are equal to these in encrpyted form",0
s14 byte "what will be the ecryption of these charcters according to the shift cipher",0
s15 byte "what will be the characters using the same shift cipher accordingly ",0
s16 byte "GOOD BYE",0
sel dword ?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;admin security variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
input_username byte 50 DUP(0)								;; array to take username and password input from user
input_password byte 50 DUP(0)

statement_username byte "username:-",0								;; basic array for printing
statement_password byte "password:-",0

filehandle_of_files DWORD ?
filenameusername BYTE "username.txt", 0								;; file handle for username text file
bufffsizzee = 50 
array_of_password BYTE bufffsizzee DUP(0)

filenameusernamepassword BYTE "password.txt", 0							;; file handle for password text file
array_of_username BYTE bufffsizzee DUP(0)


length_of_username byte 0
length_of_password byte 0									            ;; length_of_username and length_of_password to count the length of username and password input by the user



hey1 byte"acccess granted",0
hey2 byte"access denied",0


bool0 byte 1
bool1 byte 1                                                ;;bool type variable to verify username and password


copyfromfile proto,paper:ptr dword,filepointer:dword,ques:ptr dword,ch1:ptr dword ,ch2:ptr dword,right:dword,quesdup:ptr dword,choise1:ptr dword,choise2:ptr dword,array:ptr dword,keyname:ptr dword,sk:ptr dword,ans: ptr dword,duplicatearray:ptr dword,ind1:dword,ind2:dword



;;total==datasize 
;;datafile==filename
;;fh==filehandle
;; dupname==names
;; dupid==ids
;;allnames==studentname
;;allids==studentid
;;allmarks==studentmarks
;;r==row

nameid proto ,datasize: byte,filename:ptr dword,filehandle:dword,names:ptr dword,ids:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,row: dword,score:ptr dword

sorting proto ,datasize:byte,names:ptr dword,ids:ptr dword,score:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,ind1: dword,ind2:dword,num1:byte,num2:byte,row1:dword,row2:dword

paperdesigning proto,paper:ptr dword,key:ptr dword,filepointer:dword,ques:ptr dword,ch1:ptr dword ,ch2:ptr dword,right:dword,keyarray :ptr dword,sk:ptr dword

;; papername ==paper
;;paperkey==keyname
;; fp==filepointer 
;;dupques==quesdup
;;c1==choise1
;;c2==choise2
;;num==right
;;anskey==keyarray
;;kip ==sk


updatepaper proto,paper:ptr dword,filepointer:dword,ques:ptr dword,ch1:ptr dword ,ch2:ptr dword,right:dword,quesdup:ptr dword,choise1:ptr dword,choise2:ptr dword,array:ptr dword,keyname:ptr dword,sk:ptr dword,changer:dword

viewresult proto ,datasize: byte,filename:ptr dword,filehandle:dword,names:ptr dword,ids:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,row: dword,score:ptr dword


.code
CheckDuplicacy PROC, EsiCount:DWORD, Modulus:BYTE
mov al, Modulus
mov edi, 0
mov ecx, EsiCount
cmp EsiCount, 0
JZ RetLabel
L33:
    cmp al, randarray[edi]
    JZ DuplicateTrue
    inc edi
loop L33
JMP RetLabel
DuplicateTrue:
mov duplicateFlag, 1
RetLabel:
ret
CheckDuplicacy ENDP

IQ1 proc,series1: ptr dword,series2:ptr dword,num1:dword,num2:dword,ind1:dword,ind2:dword
call randomize
zeroagain:
call random32
mov ebx,10
mov edx,0

div ebx
mov num1,edx
mov eax,0
mov eax,num1



call random32
mov ebx,10
mov edx,0
div ebx

mov num2,edx
mov eax,0
mov eax,num2

cmp num1,0
je zeroagain
cmp num2,0
je zeroagain

mov ebx,num2

mov esi,series1
mov ecx,6
gen1:

mov eax,num1
mul ebx

mov [esi],eax
mov num1,eax
add esi,4
loop gen1


mov ecx,5
mov esi,series1
mov edx,offset s6
call writestring
call crlf
call crlf
serdisp :
mov eax,[esi]
call writedec
mov edx,offset spa
call writestring
add esi,4
loop serdisp
call crlf
call crlf
add esi,4
mov eax,[esi]
mov num2,eax
mov edx,offset s7
call writestring
call crlf 
call readdec
cmp eax,num1
je p1
jmp batt
p1:
mov ebx,0
inc ebx
batt:
ret
IQ1 endp


IQ2 proc,series1: ptr dword,series2:ptr dword,num1:dword,num2:dword,ind1:dword,ind2:dword
call randomize
zeroagain1:
call random32
mov ebx,10
mov edx,0

div ebx
mov num1,edx
mov eax,0
mov eax,num1



call random32
mov ebx,10
mov edx,0
div ebx

mov num2,edx
mov eax,0
mov eax,num2


call random32
mov ebx,10
mov edx,0
div ebx


mov ind1,edx
mov eax,0
mov eax,ind1

cmp num1,1
jb zeroagain1
cmp num2,1
jb zeroagain1

mov edx,offset s6
call writestring
call crlf
call crlf
mov esi,series1
mov ecx,5
iql2:

mov eax,num1
add eax,num2

mov[esi],eax
add eax,ind1

add esi,4
mov [esi],eax
add esi,4
mov num1,eax
loop iql2

mov ecx,6
mov esi,series1
mov edi,series2


iq2disp:
mov eax,[esi]
mov [edi],eax
call writedec
mov edx,offset spa
call writestring
add esi,4
add edi,4
loop iq2disp
call crlf

mov ecx,4

takeans:
mov edx,offset s7
call writestring
call crlf
call readdec
mov[edi],eax
add edi,4
loop takeans
mov ecx,10
mov esi,series1
mov edi,series2
mov ebx,0
chkans:
mov eax,[esi]
cmp eax,[edi]
je cntplus
jmp wrong2
cntplus:
mov ebx,1

loop chkans
jmp asto1
wrong2:
mov ebx,0
asto1:
ret
IQ2 endp

IQ3 proc,series1: ptr dword,series2:ptr dword,num1:dword,num2:dword,ind1:dword,ind2:dword
call randomize
mov ecx,10
mov esi,series1
mov edi,series2
prodser:
call random32
mov ebx,26
mov edx,0

div ebx
mov num1,edx
mov eax,0
mov eax,num1
mov [esi],eax
mov [edi],eax
add esi,4
add edi,4

loop prodser

mov edx,offset s6
call writestring
call crlf
call crlf

mov ecx,10
mov esi,series1
alphacon:
mov eax,65
mov ebx,[esi]
add ebx,eax
mov [esi],ebx

mov eax,[esi]
add esi,4

loop alphacon

mov ecx,5
mov esi,series1
mov edi,series2
mov edx,offset s9
call writestring
call crlf
iq3disp1:
mov eax,[esi]
call writechar
mov al,'-'
call writechar
add esi,4
loop iq3disp1
call crlf
mov ecx,5
mov edx,offset s10
call writestring
call crlf
iq3disp2:
mov eax,[edi]
call writedec
mov al,'-'
call writechar
add edi,4
loop iq3disp2
call crlf
mov ecx,5
mov edx,offset s11
call writestring
call crlf
mov ecx,5

iq3disp3:
mov eax,[esi]
call writechar
mov al,'-'
call writechar
add esi,4
loop iq3disp3

call crlf
mov esi,series1
add esi,20
mov ebx,0

mov ecx,5
takeanswer3:
call readdec
mov[esi],eax
add esi,4
cmp [edi],eax
je inccon3
jmp out3
inccon3:
mov ebx,1
add edi,4

loop takeanswer3

jmp answer3
out3:
mov ebx,0
answer3:
mov eax,ebx
ret
IQ3 ENDP


IQ4 proc,series1: ptr dword,series2:ptr dword,num1:dword,num2:dword,ind1:dword,ind2:dword
call randomize

call random32
mov ebx,10
mov edx,0

div ebx
mov num1,edx
mov eax,0
mov eax,num1


call random32
mov ebx,10
mov edx,0
div ebx

mov num2,edx
mov eax,0
mov eax,num2


mov esi,series1
mov edi,series2

mov eax,num1
mul num1

mov edx,offset s6
call writestring
call crlf
call crlf

mov num1,eax
mov [esi],eax
mov [edi],eax
add esi,4
add edi,4

mov eax,num2
mul num2
mov num2,eax
mov [esi],eax
mov [edi],eax
add esi,4
add edi,4
mov ecx,8
iq4ser:
mov eax,num1
mov ebx,num2
mov num1,ebx
add eax,num2
mov num2,eax
mov [esi],eax
add esi,4
loop iq4ser
mov ecx,6
mov esi,series1
mov edi,series2


call crlf 
iq4disp:
mov eax,[esi]
mov [edi],eax
call writedec
mov al,','
call writechar
add esi,4
add edi,4
loop iq4disp
call crlf 
mov ecx,4
mov ebx,0
iq4takeans:
mov edx,offset s7 
call writestring
mov edx,offset spa
call writestring
call readdec 
mov [edi],eax
cmp [esi],eax
je iq4cntans
jmp iq4out
iq4cntans:
mov ebx,1
add esi,4
loop iq4takeans
jmp iq4pass
iq4out:
mov ebx,0
iq4pass:
ret
IQ4 endp

IQ5 proc,series1: ptr dword,series2:ptr dword,num1:dword,num2:dword,ind1:dword,ind2:dword
call randomize

mov ecx,10
mov esi,series1
mov edi,series2
prodser5:
call random32
mov ebx,26
mov edx,0
div ebx
mov num1,edx
mov eax,0
mov eax,num1
mov [esi],eax
mov [edi],eax
add esi,4
add edi,4
loop prodser5

mov edx,offset s6
call writestring
call crlf
call crlf



mov esi,series1
mov edi,series2
mov ecx,10

cipher:
mov eax,[esi]
add eax,65
mov [esi],eax
mov edx,0
sub eax,65
add eax,5
mov ebx,26

div ebx
add edx,65
mov [edi],edx
add edi,4
add esi,4
loop cipher






mov ecx,5
mov esi,series1
mov edi,series2
mov edx,offset s12
call writestring
call crlf

iq5disp1:
mov eax,[esi]
call writechar
mov al,'-'
call writechar
add esi,4
loop iq5disp1

call crlf
mov ecx,5
mov edx,offset s13
call writestring
call crlf

iq5disp2:
mov eax,[edi]
call writechar
mov al,'-'
call writechar
add edi,4
loop iq5disp2

call crlf
mov edx,offset s14
call writestring
call crlf

mov ecx,5
iq5disp3:
mov eax,[esi]
call writechar
mov al,'-'
call writechar
add esi,4
loop iq5disp3
mov ecx,5
mov ebx,0
call crlf

iq5takeans:

mov edx,offset s15
call writestring
call crlf

call readchar
call writechar 
cmp [edi],eax
je inccnt5
jmp out5
inccnt5:
mov ebx,1
add edi,4
loop iq5takeans
jmp iq5pass
out5:
mov ebx,0
iq5pass:
ret
IQ5 endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;main proc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main proc
Mov eax,(blue *16)+white
Call setTextColor


mov ecx,7
space:
call crlf
loop space
mov edx , offset start
call writestring
call crlf

mov edx , offset start1
call writestring
call crlf

mov edx , offset start2
call writestring
call crlf

mov edx , offset start3
call writestring
call crlf

mov ecx,4
space1:
call crlf
loop space1

call waitmsg   ;wait for user to press enter
call crlf
call CLRSCR
wronginput:

mov edx,offset start
call writestring
call crlf
call crlf
mov edx,offset start4
call writestring
mov edx,offset admin_panel
call writestring
call crlf
mov edx,offset start4
call writestring
mov edx,offset candidate_panel
call writestring
call crlf
call crlf
mov edx,offset start3
call writestring
call crlf
call crlf

call readdec
mov sel,eax

cmp sel,1
je adminpanel

cmp sel,2
je candidatepanel

jne wronginput


candidatepanel:

mov edx,offset datafile
call openinputfile
mov fh,eax
mov edx,offset total
mov ecx,1
call readfromfile
mov eax,fh
call closefile
movzx eax,total
mov r,0



invoke nameid ,total,addr datafile,fh,addr dupname,addr dupid,addr allnames,addr allids,addr allmarks,r,addr sc

mov bl,buffersize
mov al,total
mul bl
movzx ebx,al
mov r,ebx

inc total
mov edi,0


mov edx,offset s
call writestring
call crlf
mov edx,offset dupname
mov ecx,sizeof dupname
call readstring
 
 mov edx,offset s1
call writestring
call crlf

 mov edx,offset dupid
mov ecx,sizeof dupid
call readstring

mov edi,offset allnames
add edi,r
mov esi,offset dupname
mov ecx,buffersize
rep movsb

mov edi,offset allids
add edi,r
mov esi,offset dupid
mov ecx,10
rep movsb

call randomize
mov esi,0
mov ecx, lengthof randarray
L111222:
    RetryLabel:
    mov duplicateFlag, 0
    call random32
    mov ebx, 10
    mov edx, 0
    div ebx
    push ecx
    INVOKE CheckDuplicacy, esi, dl
    pop ecx
    cmp duplicateFlag, 1
    JZ RetryLabel
    mov randarray[esi], dl
    add esi,1
Loop L111222


mov esi,0
mov ecx,noofques
l444:
movzx eax,randarray[esi]
add esi,1
loop l444

mov edx,offset s2
call writestring
call crlf
call waitmsg
call CLRSCR
invoke copyfromfile ,addr papername,fp,addr question,addr choice1,addr choice2,num,addr dupques,addr c1,addr c2,addr anskey,addr paperkey,addr kip,addr takeanswer,addr randarray,index1,index2
mov edx,offset s5
call writestring
call crlf
call waitmsg

mov sc,al
invoke IQ1 ,addr iqser1,addr iqser2,lum1,lum2,index1,index2
call CLRSCR
add sc,bl
invoke IQ2 ,addr iqser1,addr iqser2,lum1,lum2,index1,index2
add sc,bl
call CLRSCR
invoke IQ3 ,addr iqser1,addr iqser2,lum1,lum2,index1,index2
add sc,bl
call CLRSCR
invoke IQ4 ,addr iqser1,addr iqser2,lum1,lum2,index1,index2
add sc,bl
call CLRSCR
invoke IQ5 ,addr iqser1,addr iqser2,lum1,lum2,index1,index2
add sc,bl
call CLRSCR
mov al,sc

movzx edi,total
sub edi,1
mov allmarks[edi],al

invoke sorting ,total,addr dupname,addr dupid,addr sc,addr allnames,addr allids,addr allmarks,index1,index2,n1,n2,r1,r2
mov edx,offset datafile
call createoutputfile
mov fh,eax
mov edx,offset total
mov ecx,1
mov eax,fh
call writetofile

mov r,100

invoke nameid ,total,addr datafile,fh,addr dupname,addr dupid,addr allnames,addr allids,addr allmarks,r,addr sc

Mov dl,24
Mov dh,9
Call GotoXY

mov edx,offset s16
call writestring
call crlf
call crlf
jmp fin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;student pannel;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





adminpanel:




mov edx,offset statement_username
call writestring											;; taking username from user
mov edx,offset input_username
mov ecx,lengthof input_username
call readstring
call crlf

mov edx,offset statement_password
call writestring											;; taking password from user
mov edx,offset input_password
mov ecx,lengthof input_password
call readstring
call crlf

mov ecx,50
mov esi,0
p1:
mov al,input_username[esi]
cmp al,0
je tra
add length_of_username,1                                              ;;calculating length of username provided by the user for future use in loops
add esi,1
loop p1
tra:

mov ecx,50
mov esi,0
p2:
mov al,input_password[esi]
cmp al,0
je tra1													   ;;calculating length of password provided by the user for future use in loops
add length_of_password,1
add esi,1
loop p2
tra1:



mov edx,OFFSET filenameusername
call OpenInputFile
mov filehandle_of_files, EAX                                        ;;username
mov edx, OFFSET array_of_password									   ;;array_of_password will contain the text read from the file
mov ecx, bufffsizzee										   ;;specify how many bytes to read
call ReadFromFile



mov edx,OFFSET filenameusernamepassword
call OpenInputFile
mov filehandle_of_files, EAX										   ;;password
mov edx, OFFSET array_of_username                                    ;;array_of_password will contain the text read from the file
mov ecx, bufffsizzee										   ;;specify how many bytes to read
call ReadFromFile


mov ecx,50													 
mov esi,0
l99:
mov al,array_of_password[esi]
sub al,100													;; decrypting username from the file

mov array_of_password[esi],al

mov bl,array_of_username[esi]
sub bl,100													;; decrypting password from the file

mov array_of_username[esi],bl
add esi,1
loop l99


movzx ecx,length_of_username
mov esi,0
checking_username:
mov al,input_username[esi]
cmp al,array_of_password[esi]											;; checking username from file and user provided username			
jne oop1												    ;; changing bool variable to false
add esi,1
loop checking_username
jmp here
oop1:
mov bool0,0


here:
movzx ecx,length_of_password
mov esi,0
checking_password:
mov al,input_password[esi]
cmp al,array_of_username[esi]											;; checking username from file and user provided username			
jne oop2												    ;; changing bool variable to false
add esi,1
loop checking_password
jmp here1
oop2:
mov bool1,0

													

here1:
mov al,bool0
cmp al,0
je ntruea													;; comparing bool0 and bool1 to find if the username and password was same or not 
mov bl,bool1
cmp bl,0
je ntruea

trueaa:

call clrscr
mov edx,offset hey1
call writestring											;;access granted
mov edx,offset a
call writestring
call crlf
mov edx,offset a1
call writestring
call crlf
mov edx,offset a2
call writestring
call crlf
mov edx,offset a12
call writestring
call crlf

mov edx,offset a3
call writestring
call crlf

call readdec
mov sel,eax

cmp sel,1
je design_paper 

cmp sel,2
je updatepaperlabel

cmp sel,3
je viewresultscore

cmp sel,4
je examinpaper

cmp sel,5
je fin
ntruea:
mov edx,offset hey2											;;access DENIED
call writestring
jmp eline



design_paper:

invoke paperdesigning ,addr papername,addr paperkey,fp,addr dupques,addr c1,addr c2,num,addr anskey,addr kip
call CLRSCR
jmp trueaa

updatepaperlabel:
mov index1,0
invoke updatepaper ,addr papername,fp,addr question,addr choice1,addr choice2,num,addr dupques,addr c1,addr c2,addr anskey,addr paperkey,addr kip,index1
call CLRSCR
jmp trueaa

examinpaper:
mov index1,100
invoke updatepaper ,addr papername,fp,addr question,addr choice1,addr choice2,num,addr dupques,addr c1,addr c2,addr anskey,addr paperkey,addr kip,index1
call waitmsg
jmp trueaa

viewresultscore:
CALL CLRSCR
invoke viewresult ,total,addr datafile,fh,addr dupname,addr dupid,addr allnames,addr allids,addr allmarks,r,addr sc
call waitmsg
jmp trueaa

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;admin pannel;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


eline:
fin:
EXIT
main ENDP



;; nameid proc is used to keep the data of the student which is going to take exam or test
;; this procedure is responsible of reading  all the data in the file data.txt and store it in 2d container 
;; this operation is perforemed with th helof duplicate name and id string whic is used to read from the file and mov into the 
;; 2d container 
;; studentname==allnames
;;studentid==allid
;;studentmarks==allmarks

;;names==dupnames
;; ids==allids
;;row is used to control the flow of updation and containing

nameid proc ,datasize:byte,filename:ptr dword,filehandle: dword,names:ptr dword,ids:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,row:dword,score :ptr dword

;;the below two lines check if row >0 than this time proc call is to update the name id and score

cmp row,0
jne updation


;; following code is used to read all through the file and contain all the data from the data.txt to 2d container allnames,allids,allmarks

mov edx, filename
call openinputfile
mov filehandle,eax

mov edx,ids
mov ecx,1
mov eax,filehandle
call readfromfile



mov row,0
movzx ecx,datasize
cmp ecx,0
je next
mov ebx,0

l1:
push ecx

mov edx, names
mov ecx,buffersize
mov eax ,filehandle
call readfromfile

mov edx,ids

mov ecx,buffersize
mov eax ,filehandle
call readfromfile

mov edx,score
mov ecx,1
mov eax,filehandle
call readfromfile

cld
mov edi, studentname
add edi,row

mov esi, names
mov ecx,buffersize
rep movsb

mov edi, studentid
add edi,row
mov esi, ids
mov ecx,buffersize
rep movsb


mov edi,studentmarks
add edi,ebx
mov esi ,score
mov ecx,1
rep movsb

mov esi,score
mov ecx,1
lodsb
;call writedec
;call crlf

inc ebx
add row,buffersize
pop ecx

loop l1

next:
mov eax,filehandle
call closefile
jmp exyt

;;updating of the current id and name of the student taking examination

updation:

movzx ecx,datasize
mov row,0
mov ebx,0
l2:
push ecx
cld
mov esi, studentname
add esi,row
mov edi, names
mov ecx,buffersize
rep movsb

mov esi, studentid
add esi,row
mov edi, ids
mov ecx,buffersize
rep movsb 

mov esi,studentmarks
add esi,ebx

mov edi,score
mov ecx,1
rep movsb

mov eax,filehandle
mov edx, names
mov ecx,buffersize
call writetofile

mov eax,filehandle
mov edx, ids
mov ecx,buffersize
call writetofile

mov eax,filehandle
mov edx,score
mov ecx,1
call writetofile

add row,buffersize
inc ebx
pop ecx
loop l2
mov eax,filehandle
call closefile

exyt:
ret
nameid endp



sorting proc ,datasize:byte,names:ptr dword,ids:ptr dword,score:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,ind1: dword,ind2:dword,num1:byte,num2:byte,row1:dword,row2:dword
movzx eax,datasize
cmp eax,1
je sorted
mov ind1,eax
sub ind1,1
mov ind2,eax
sub ind2,2


movzx ecx,datasize
dec ecx

cld
sort:
push ecx

mov esi,studentmarks
add esi,ind1
mov ecx,1
rep lodsb
mov num1,al
mov esi,studentmarks
add esi,ind2
mov ecx,1
rep lodsb
mov num2,al

mov al,num1



mov al,num2

cmp num1,al
jbe sorted
ja swapping
cld

swapping:
mov edi,studentmarks
add edi,ind1
mov ecx,1
mov al,num2
stosb
mov edi,studentmarks
add edi ,ind2
mov ecx,1
mov al,num1
stosb


jmp continue

again:

dec ind1
dec ind2
pop ecx
loop sort
jmp sorted
continue :

mov ebx,buffersize
mov eax,ind1
mul ebx
mov row1,eax

mov eax,ind2
mul ebx
mov row2,eax

mov esi,studentname
add esi,row1
mov edi,names
mov ecx,buffersize
rep movsb

mov esi,studentid
add esi,row1
mov edi,ids
mov ecx,buffersize
rep movsb

mov edi,studentname
add edi,row1
mov esi,studentname
add esi,row2
mov ecx,buffersize
rep movsb

mov edi,studentid
add edi,row1
mov esi,studentid
add esi,row2
mov ecx,buffersize
rep movsb

mov edi,studentname
add edi,row2
mov esi,names
mov ecx,buffersize
rep movsb

mov edi,studentid
add edi,row2
mov esi,ids
mov ecx,buffersize
rep movsb
jmp again

sorted:
ret 
sorting endp




copyfromfile proc,paper:ptr dword,filepointer:dword,ques:ptr dword,ch1:ptr dword ,ch2:ptr dword,right:dword,quesdup:ptr dword,choise1:ptr dword,choise2:ptr dword,array:ptr dword,keyname:ptr dword,sk:ptr dword,ans: ptr dword,duplicatearray:ptr dword,ind1:dword,ind2:dword

;; following lines are used to open the existing file of question paper

mov edx,paper
call openinputfile
mov filepointer,eax
mov right,0 
mov ecx,noofques

;; begin loop is used to read the questions and choices  from the file paper(question paper) 
;; it will firstly read into dupques==quesdup and than mov in to 2d container of question
;; question==ques 
;; choice1== ch1
;; choice2== ch2
;; c1==choise1
;; c2==choise2

begin:
push ecx
mov edx, quesdup
mov ecx,qsize
mov eax,filepointer
call readfromfile

mov edi,ques
add edi,right
mov esi, quesdup
mov ecx,qsize
rep movsb

mov edx, choise1
mov ecx,qsize
mov eax,filepointer
call readfromfile
mov edi,ch1
add edi,right
mov esi, choise1
mov ecx,qsize
rep movsb
mov edx, choise2
mov ecx,qsize
mov eax,filepointer
call readfromfile
mov edi,ch2
add edi,right
mov esi, choise2
mov ecx,qsize
rep movsb

add right,qsize
pop ecx
loop begin

mov eax,fp
call closefile

mov right,0
mov ecx,noofques
mov ebx,0
mov ind1,0
mov ind2,0
;; display loop is used to display the questions and respective choices one by one and requires the answers from the users 
;; from the container of 2d array (ques ) it is moved in to dupques and same functionality with choices and then display
;; read the answer from the user in sk (kip) and moved in to ans

display:
push ecx
mov esi,duplicatearray
add esi,ind1
lodsb 
movzx ecx,al
mov ind2,ecx
mov eax,ind2
mov right,eax
mov ecx,qsize
mov eax,right 
mul ecx
mov right,eax
mov edi,quesdup
mov esi,ques
add esi,right
mov ecx,qsize
rep movsb
mov edx,quesdup
call writestring
call crlf

mov edi,choise1
mov esi,ch1
add esi,right
mov ecx,qsize
rep movsb
mov edx,choise1
call writestring
call crlf

mov edi,choise2
mov esi,ch2
add esi,right
mov ecx,qsize
rep movsb
mov edx,choise2
call writestring
jmp cont
bck:
inc ind1
pop ecx
loop display

jmp lolo
cont:
call crlf
mov edx,offset s3
call writestring
call crlf
call crlf
mov edx,sk
mov ecx,2
call readstring
mov esi,sk
mov edi,ans
add edi,ind2
mov ecx,1
rep movsb

jmp bck

 lolo:

mov edx,ans
call writestring
call crlf


;; this fllowing lines of code is used to take input the answerkey in string from the file keyname(paperkey)
mov right,0

mov edx,keyname

call openinputfile
mov filepointer,eax
mov ecx,noofques
mov edx,array
mov ecx,noofques
call readfromfile
mov eax,filepointer
call closefile
cld
mov ecx,noofques
mov esi,array
mov edi,array
decrypt:
lodsb
sub al,20
rol al,3
stosb
loop decrypt

;; the following line of code is used check the given answers in ans array and (array) conatains the key from the file 
mov ecx,noofques
mov esi,array
 mov edi,ans
mov right,0
cld
 check:
 push ecx
 
 cmpsb
 je increment
 jmp nnn
 increment:
 inc right
 nnn:
 pop ecx
 loop check

 mov edx,offset s4
 call writestring
 call crlf

 mov eax,right

 call writedec
 call crlf
 call crlf
 ;; write contain the number of right answers and marks obtained by the student
ret 
copyfromfile endp





;; this function is used to design the paper and give its answer key for the studenst to take the examination 

paperdesigning proc,paper:ptr dword,key:ptr dword,filepointer:dword,ques:ptr dword,ch1: ptr dword,ch2:ptr dword,right:dword,keyarray:ptr dword,sk:ptr dword

mov edx,paper
call createoutputfile
mov filepointer,eax
mov ecx,noofques

;; the following loop is used to take the input questions and choices from the user and  write it down in the file name by paper 

design:
push ecx
mov edx,offset a4
call writestring
call crlf
mov edx,ques
mov ecx,qsize
call readstring

mov eax,filepointer
mov edx,ques
mov ecx,qsize
call writetofile

mov edx,offset a5
call writestring
;call crlf

mov edx,ch1
mov ecx,qsize
call readstring
mov edx,ch1
mov ecx,qsize
mov eax,filepointer
call writetofile

mov edx,offset a6
call writestring
;call crlf
mov edx,ch2
mov ecx,qsize
call readstring
mov edx,ch2
mov ecx,qsize
mov eax,filepointer
call writetofile

pop ecx
loop design


mov eax,filepointer
call closefile





;; the following code is used to take answer key from the admin and write it to the key file

mov edi,keyarray
mov edx,key

call createoutputfile

mov filepointer,eax
mov ecx,noofques
cld

keydesign:
push ecx

mov edx,offset a11
call writestring
call crlf
call crlf


mov edx,sk
mov ecx,2
call readstring

mov esi,sk
mov ecx,1
rep movsb

pop ecx
loop keydesign

mov edx,keyarray 
call writestring
call crlf
cld
mov esi,keyarray
mov edi,keyarray
mov ecx,noofques

encryption:
lodsb
ror al,3
add al,20
stosb
loop encryption

mov edx,keyarray
mov ecx,noofques
mov eax,filepointer
call writetofile

mov eax,filepointer
call closefile
ret

paperdesigning endp




updatepaper proc,paper:ptr dword,filepointer:dword,ques:ptr dword,ch1:ptr dword ,ch2:ptr dword,right:dword,quesdup:ptr dword,choise1:ptr dword,choise2:ptr dword,array:ptr dword,keyname:ptr dword,sk:ptr dword,changer:dword



mov edx,paper
call openinputfile
mov filepointer,eax
mov right,0 
mov ecx,noofques



load:
push ecx
mov edx, quesdup
mov ecx,qsize
mov eax,filepointer
call readfromfile

mov edi,ques
add edi,right
mov esi, quesdup
mov ecx,qsize
rep movsb

mov edx, choise1
mov ecx,qsize
mov eax,filepointer
call readfromfile
mov edi,ch1
add edi,right
mov esi, choise1
mov ecx,qsize
rep movsb
mov edx, choise2
mov ecx,qsize
mov eax,filepointer
call readfromfile
mov edi,ch2
add edi,right
mov esi, choise2
mov ecx,qsize
rep movsb

add right,qsize
pop ecx
loop load

mov eax,filepointer
call closefile

mov right,0
mov ecx,noofques
mov ebx,0


checking:

push ecx
mov edi,quesdup
mov esi,ques
add esi,right
mov ecx,qsize
rep movsb
mov edx,quesdup
call writestring
call crlf

mov edi,choise1
mov esi,ch1
add esi,right
mov ecx,qsize
rep movsb
mov edx,choise1
call writestring
call crlf

mov edi,choise2
mov esi,ch2
add esi,right
mov ecx,qsize
rep movsb
mov edx,choise2
call writestring
call crlf
add right,qsize
pop ecx

loop checking

cmp changer,0
ja nochanging



mov edx,offset a7
call writestring
call crlf
call crlf


call readdec
mov right,eax
dec right

mov edx,offset a4
call writestring
call crlf
call crlf

mov edx,quesdup
mov ecx,qsize
call readstring


mov edx,offset a5
call writestring
call crlf
call crlf

mov edx,choise1
mov ecx,qsize
call readstring



mov edx,offset a6
call writestring
call crlf
call crlf

mov edx,choise2
mov ecx,qsize
call readstring

mov eax,qsize
mul right
mov right,eax

mov edi,ques
add edi,right
mov esi,quesdup
mov ecx,qsize
rep movsb

mov edi,ch1
add edi,right
mov esi,choise1
mov ecx,qsize
rep movsb

mov edi,ch2
add edi,right
mov esi,choise2
mov ecx,qsize
rep movsb

mov edx,paper
call createoutputfile
mov filepointer,eax
call writedec


mov right ,0
mov ecx,noofques

updatefile:

push ecx

mov esi,ques
add esi,right
mov edi,quesdup
mov ecx,qsize
rep movsb

mov esi,ch1
add esi,right
mov edi,choise1
mov ecx,qsize
rep movsb

mov esi,ch2
add esi,right
mov edi,choise2
mov ecx,qsize
rep movsb

mov edx,quesdup
mov ecx,qsize
mov eax,filepointer
call writetofile


mov edx,choise1
mov ecx,qsize
mov eax,filepointer
call writetofile

mov edx,choise2
mov ecx,qsize
mov eax,filepointer
call writetofile

add right,qsize
pop ecx

loop updatefile

nochanging:

mov eax,filepointer
call closefile

ret 

updatepaper endp



viewresult proc ,datasize: byte,filename:ptr dword,filehandle:dword,names:ptr dword,ids:ptr dword,studentname:ptr dword,studentid:ptr dword,studentmarks:ptr dword,row: dword,score:ptr dword

mov edx, filename
call openinputfile
mov filehandle,eax

mov edx,ids
mov ecx,1
mov eax,filehandle
call readfromfile

mov esi,ids
lodsb
mov datasize,al
mov row,0
movzx ecx,datasize
cmp ecx,0
je nextt
mov ebx,0
mov edx,offset a8
call writestring
mov edx,offset spa
call writestring

mov edx,offset a9
call writestring
mov edx,offset spa
call writestring
mov edx,offset a10
call writestring
mov edx,offset spa
call writestring
call crlf 
call crlf
l111:
push ecx

mov edx, names
mov ecx,buffersize
mov eax ,filehandle
call readfromfile

mov edx,ids

mov ecx,buffersize
mov eax ,filehandle
call readfromfile

mov edx,score
mov ecx,1
mov eax,filehandle
call readfromfile

mov edx,names
call writestring
mov edx,offset spa
call writestring


mov edx,ids
call writestring
mov edx,offset spa
call writestring

mov esi,score
mov ecx,1
lodsb
call writedec
mov edx,offset spa
call writestring
call crlf
inc ebx
add row,buffersize
pop ecx
loop l111

nextt:
mov eax,filehandle
call closefile


ret
viewresult endp



END main
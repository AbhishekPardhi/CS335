
RecurseFunc.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edi],bl
   a:	or     al,BYTE PTR [eax]
   c:	push   es
   d:	add    BYTE PTR [edx],dl
   f:	or     DWORD PTR [eax],eax
  11:	adc    eax,DWORD PTR [eax]
  13:	adc    al,0xa
  15:	add    BYTE PTR ds:0xa1600,dl
  1b:	add    eax,0x71700
  20:	sbb    BYTE PTR [edi],al
  22:	add    BYTE PTR [ecx],bl
  24:	add    DWORD PTR [eax],eax
  26:	push   es
  27:	cmp    al,0x69
  29:	outs   dx,BYTE PTR ds:[esi]
  2a:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  32:	push   esi
  33:	add    DWORD PTR [eax],eax
  35:	add    al,0x43
  37:	outs   dx,DWORD PTR ds:[esi]
  38:	fs add DWORD PTR gs:[eax],eax
  3c:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  40:	gs dec esi
  42:	jne    0xb1
  44:	bound  esp,QWORD PTR [ebp+0x72]
  47:	push   esp
  48:	popa   
  49:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  4d:	add    BYTE PTR [eax],cl
  4f:	jo     0xc3
  51:	imul   ebp,DWORD PTR [esi+0x74],0x16e7546
  58:	add    BYTE PTR [eax+ebp*1],al
  5b:	dec    ecx
  5c:	sub    DWORD PTR [esi+0x1],edx
  5f:	add    BYTE PTR ds:0x63617453,cl
  65:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  69:	push   esp
  6a:	popa   
  6b:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  6f:	add    BYTE PTR [ebp*2+0x16e6961],al
  76:	add    BYTE PTR [esi],dl
  78:	sub    BYTE PTR [ebx+0x4c],bl
  7b:	push   0x61
  7d:	jbe    0xe0
  7f:	das    
  80:	ins    BYTE PTR es:[edi],dx
  81:	popa   
  82:	outs   dx,BYTE PTR ds:[esi]
  83:	addr16 das 
  85:	push   ebx
  86:	je     0xfa
  88:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  8f:	add    BYTE PTR [edx],cl
  91:	push   ebx
  92:	outs   dx,DWORD PTR ds:[esi]
  93:	jne    0x107
  95:	arpl   WORD PTR [ebp+0x46],sp
  98:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x65521000
  a0:	arpl   WORD PTR [ebp+0x72],si
  a3:	jae    0x10a
  a5:	inc    esi
  a6:	jne    0x116
  a8:	arpl   WORD PTR [esi],bp
  aa:	push   0x61
  ac:	jbe    0x10f
  ae:	or     al,0x0
  b0:	pop    es
  b1:	add    BYTE PTR [eax],cl
  b3:	pop    es
  b4:	add    BYTE PTR [edx],bl
  b6:	or     al,0x0
  b8:	sbb    eax,DWORD PTR [eax]
  ba:	sbb    al,0x7
  bc:	add    BYTE PTR ds:0x1e000c,bl
  c2:	or     al,0xc
  c4:	add    BYTE PTR [ebx],cl
  c6:	add    BYTE PTR [ecx+eax*1],cl
  c9:	add    BYTE PTR [ebx],cl
  cb:	push   edx
  cc:	arpl   WORD PTR gs:[ebp+0x72],si
  d0:	jae    0x137
  d2:	inc    esi
  d3:	jne    0x143
  d5:	arpl   WORD PTR [ecx],ax
  d7:	add    BYTE PTR [eax],dl
  d9:	push   0x61
  db:	jbe    0x13e
  dd:	das    
  de:	ins    BYTE PTR es:[edi],dx
  df:	popa   
  e0:	outs   dx,BYTE PTR ds:[esi]
  e1:	addr16 das 
  e3:	dec    edi
  e4:	bound  ebp,QWORD PTR [edx+0x65]
  e7:	arpl   WORD PTR [ecx+eax*1+0x0],si
  eb:	adc    BYTE PTR [edx+0x61],ch
  ee:	jbe    0x151
  f0:	das    
  f1:	ins    BYTE PTR es:[edi],dx
  f2:	popa   
  f3:	outs   dx,BYTE PTR ds:[esi]
  f4:	addr16 das 
  f6:	push   ebx
  f7:	jns    0x16c
  f9:	je     0x160
  fb:	ins    DWORD PTR es:[edi],dx
  fc:	add    DWORD PTR [eax],eax
  fe:	add    ebp,DWORD PTR [edi+0x75]
 101:	je     0x104
 103:	add    BYTE PTR ds:0x76616a4c,dl
 109:	popa   
 10a:	das    
 10b:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 112:	je     0x167
 114:	je     0x188
 116:	gs popa 
 118:	ins    DWORD PTR es:[edi],dx
 119:	cmp    eax,DWORD PTR [ecx]
 11b:	add    BYTE PTR [ebx],dl
 11d:	push   0x61
 11f:	jbe    0x182
 121:	das    
 122:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 129:	je     0x17e
 12b:	je     0x19f
 12d:	gs popa 
 12f:	ins    DWORD PTR es:[edi],dx
 130:	add    DWORD PTR [eax],eax
 132:	pop    es
 133:	jo     0x1a7
 135:	imul   ebp,DWORD PTR [esi+0x74],0x20006e6c
 13c:	add    BYTE PTR ds:0x600,al
 142:	add    BYTE PTR [eax],al
 144:	add    BYTE PTR [ebx],al
 146:	add    BYTE PTR [eax],al
 148:	add    BYTE PTR [edi],al
 14a:	add    BYTE PTR [eax],cl
 14c:	add    BYTE PTR [ecx],al
 14e:	add    BYTE PTR [ecx],cl
 150:	add    BYTE PTR [eax],al
 152:	add    BYTE PTR ds:0x1000100,bl
 158:	add    BYTE PTR [eax],al
 15a:	add    BYTE PTR ds:0x100b72a,al
 160:	mov    cl,0x0
 162:	add    BYTE PTR [eax],al
 164:	add    DWORD PTR [eax],eax
 166:	or     al,BYTE PTR [eax]
 168:	add    BYTE PTR [eax],al
 16a:	push   es
 16b:	add    BYTE PTR [ecx],al
 16d:	add    BYTE PTR [eax],al
 16f:	add    BYTE PTR [eax+eax*1],al
 172:	or     BYTE PTR [eax],al
 174:	or     eax,DWORD PTR [eax]
 176:	or     al,0x0
 178:	add    DWORD PTR [eax],eax
 17a:	or     DWORD PTR [eax],eax
 17c:	add    BYTE PTR [eax],al
 17e:	push   eax
 17f:	add    BYTE PTR [edx],al
 181:	add    BYTE PTR [ecx],al
 183:	add    BYTE PTR [eax],al
 185:	add    BYTE PTR [ebx],bl
 187:	sbb    al,BYTE PTR [edx+eiz*4]
 18a:	add    BYTE PTR [ecx+esi*4],al
 18d:	mov    dl,0x0
 18f:	add    bl,BYTE PTR [edx]
 191:	mov    dh,0x0
 193:	add    ebx,DWORD PTR [edx]
 195:	add    al,0x64
 197:	mov    eax,0xb20400
 19c:	add    bl,BYTE PTR [edx]
 19e:	mov    dh,0x0
 1a0:	add    esi,DWORD PTR [ecx+0x2000000]
 1a6:	add    BYTE PTR [edx],cl
 1a8:	add    BYTE PTR [eax],al
 1aa:	add    BYTE PTR [edx],bl
 1ac:	add    BYTE PTR [esi],al
 1ae:	add    BYTE PTR [eax],al
 1b0:	add    BYTE PTR [edi],al
 1b2:	add    BYTE PTR ds:0x6000800,al
 1b8:	add    BYTE PTR [edx],cl
 1ba:	add    BYTE PTR ds:0x13000b00,cl
 1c0:	add    BYTE PTR [eax+eax*1],cl
 1c3:	sbb    al,BYTE PTR [eax]
 1c5:	or     eax,0xd00
 1ca:	add    BYTE PTR [ebx],al
 1cc:	add    BYTE PTR [ecx],al
 1ce:	push   es
 1cf:	add    BYTE PTR [ecx],cl
 1d1:	add    BYTE PTR [esi],cl
 1d3:	add    BYTE PTR [edi],cl
 1d5:	add    BYTE PTR [ecx],al
 1d7:	add    BYTE PTR [ecx],cl
 1d9:	add    BYTE PTR [eax],al
 1db:	add    BYTE PTR [edi],ah
 1dd:	add    BYTE PTR [ecx],al
 1df:	add    BYTE PTR [edx],al
 1e1:	add    BYTE PTR [eax],al
 1e3:	add    BYTE PTR [edi],al
 1e5:	push   es
 1e6:	cmp    al,0x1b
 1e8:	mov    eax,0xb10400
 1ed:	add    BYTE PTR [eax],al
 1ef:	add    DWORD PTR [eax],eax
 1f1:	or     al,BYTE PTR [eax]
 1f3:	add    BYTE PTR [eax],al
 1f5:	push   cs
 1f6:	add    BYTE PTR [ebx],al
 1f8:	add    BYTE PTR [eax],al
 1fa:	add    BYTE PTR [eax+eax*1],dl
 1fd:	add    al,BYTE PTR [eax]
 1ff:	adc    eax,0x16000600
 204:	add    BYTE PTR [ecx],al
 206:	add    BYTE PTR [eax],dl
 208:	add    BYTE PTR [eax],al
 20a:	add    BYTE PTR [edx],al
 20c:	add    BYTE PTR [ecx],dl

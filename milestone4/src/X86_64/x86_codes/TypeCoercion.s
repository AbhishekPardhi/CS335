
TypeCoercion.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [esi],dh
   a:	or     al,BYTE PTR [eax]
   c:	or     DWORD PTR [eax],eax
   e:	push   ss
   f:	push   es
  10:	inc    eax
  11:	or     DWORD PTR [ecx],esp
  13:	std    
  14:	adc    eax,0x990f469
  19:	add    BYTE PTR [edi],dl
  1b:	add    BYTE PTR [eax],bl
  1d:	or     BYTE PTR [eax],al
  1f:	sbb    DWORD PTR [edx],ecx
  21:	add    BYTE PTR [edx],bl
  23:	add    BYTE PTR [ebx],bl
  25:	adc    al,BYTE PTR [eax]
  27:	add    BYTE PTR [eax],al
  29:	pop    ds
  2a:	pop    es
  2b:	add    BYTE PTR [eax],ah
  2d:	pop    es
  2e:	add    BYTE PTR [ecx],ah
  30:	add    DWORD PTR [eax],eax
  32:	add    DWORD PTR [ecx+0x1],esp
  35:	add    BYTE PTR [ecx],al
  37:	dec    ecx
  38:	add    DWORD PTR [eax],eax
  3a:	add    DWORD PTR [edx+0x1],esp
  3d:	add    BYTE PTR [ecx],al
  3f:	arpl   WORD PTR [ecx],ax
  41:	add    BYTE PTR [esi],al
  43:	cmp    al,0x69
  45:	outs   dx,BYTE PTR ds:[esi]
  46:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  4e:	push   esi
  4f:	add    DWORD PTR [eax],eax
  51:	add    al,0x43
  53:	outs   dx,DWORD PTR ds:[esi]
  54:	fs add DWORD PTR gs:[eax],eax
  58:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  5c:	gs dec esi
  5e:	jne    0xcd
  60:	bound  esp,QWORD PTR [ebp+0x72]
  63:	push   esp
  64:	popa   
  65:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  69:	add    BYTE PTR [ebp*2+0x16e6961],al
  70:	add    BYTE PTR [esi],dl
  72:	sub    BYTE PTR [ebx+0x4c],bl
  75:	push   0x61
  77:	jbe    0xda
  79:	das    
  7a:	ins    BYTE PTR es:[edi],dx
  7b:	popa   
  7c:	outs   dx,BYTE PTR ds:[esi]
  7d:	addr16 das 
  7f:	push   ebx
  80:	je     0xf4
  82:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  89:	add    BYTE PTR [edx],cl
  8b:	push   ebx
  8c:	outs   dx,DWORD PTR ds:[esi]
  8d:	jne    0x101
  8f:	arpl   WORD PTR [ebp+0x46],sp
  92:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x79541100
  9a:	jo     0x101
  9c:	inc    ebx
  9d:	outs   dx,DWORD PTR ds:[esi]
  9e:	gs jb  0x104
  a1:	imul   ebp,DWORD PTR [edi+0x6e],0x76616a2e
  a8:	popa   
  a9:	or     al,0x0
  ab:	push   cs
  ac:	add    BYTE PTR [edi],cl
  ae:	pop    es
  af:	add    BYTE PTR [edx],ah
  b1:	or     al,0x0
  b3:	and    eax,DWORD PTR [eax]
  b5:	and    al,0x1
  b7:	add    BYTE PTR [esi],cl
  b9:	inc    esp
  ba:	jne    0x129
  bc:	ins    DWORD PTR es:[edi],dx
  bd:	jns    0xdf
  bf:	jo     0x133
  c1:	imul   ebp,DWORD PTR [esi+0x74],0x733203a
  c8:	add    BYTE PTR ds:0x26000c,ah
  ce:	daa    
  cf:	add    DWORD PTR [eax],eax
  d1:	adc    BYTE PTR [edx+0x6f],al
  d4:	outs   dx,DWORD PTR ds:[esi]
  d5:	je     0x14a
  d7:	je     0x14b
  d9:	popa   
  da:	jo     0x129
  dc:	gs je  0x147
  df:	outs   dx,DWORD PTR ds:[esi]
  e0:	fs jae 0xf2
  e3:	push   es
  e4:	add    BYTE PTR [eax],ch
  e6:	or     BYTE PTR [eax],al
  e8:	sub    DWORD PTR [eax+eax*1],ecx
  eb:	sub    al,BYTE PTR [eax]
  ed:	sub    eax,DWORD PTR [ecx]
  ef:	add    BYTE PTR [esp+edx*2],cl
  f2:	jns    0x164
  f4:	gs inc ebx
  f6:	outs   dx,DWORD PTR ds:[esi]
  f7:	gs jb  0x15d
  fa:	imul   ebp,DWORD PTR [edi+0x6e],0x6a100001
 101:	popa   
 102:	jbe    0x165
 104:	das    
 105:	ins    BYTE PTR es:[edi],dx
 106:	popa   
 107:	outs   dx,BYTE PTR ds:[esi]
 108:	addr16 das 
 10a:	dec    edi
 10b:	bound  ebp,QWORD PTR [edx+0x65]
 10e:	arpl   WORD PTR [ecx+eax*1+0x0],si
 112:	adc    BYTE PTR [edx+0x61],ch
 115:	jbe    0x178
 117:	das    
 118:	ins    BYTE PTR es:[edi],dx
 119:	popa   
 11a:	outs   dx,BYTE PTR ds:[esi]
 11b:	addr16 das 
 11d:	push   ebx
 11e:	jns    0x193
 120:	je     0x187
 122:	ins    DWORD PTR es:[edi],dx
 123:	add    DWORD PTR [eax],eax
 125:	add    ebp,DWORD PTR [edi+0x75]
 128:	je     0x12b
 12a:	add    BYTE PTR ds:0x76616a4c,dl
 130:	popa   
 131:	das    
 132:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 139:	je     0x18e
 13b:	je     0x1af
 13d:	gs popa 
 13f:	ins    DWORD PTR es:[edi],dx
 140:	cmp    eax,DWORD PTR [ecx]
 142:	add    BYTE PTR [ebx],dl
 144:	push   0x61
 146:	jbe    0x1a9
 148:	das    
 149:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 150:	je     0x1a5
 152:	je     0x1c6
 154:	gs popa 
 156:	ins    DWORD PTR es:[edi],dx
 157:	add    DWORD PTR [eax],eax
 159:	pop    es
 15a:	jo     0x1ce
 15c:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 163:	adc    eax,0x616a4c28
 168:	jbe    0x1cb
 16a:	das    
 16b:	ins    BYTE PTR es:[edi],dx
 16c:	popa   
 16d:	outs   dx,BYTE PTR ds:[esi]
 16e:	addr16 das 
 170:	push   ebx
 171:	je     0x1e5
 173:	imul   ebp,DWORD PTR [esi+0x67],0xa56293b
 17a:	add    BYTE PTR [eax+eax*1],ch
 17d:	sub    eax,0x45060001
 182:	js     0x1f4
 184:	cmp    ah,BYTE PTR [eax]
 186:	add    DWORD PTR [ecx],eax
 188:	add    BYTE PTR [edi],dl
 18a:	ins    DWORD PTR es:[edi],dx
 18b:	popa   
 18c:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 190:	outs   dx,BYTE PTR ds:[esi]
 191:	arpl   WORD PTR [ecx+0x74],sp
 194:	push   edi
 195:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 19d:	popa   
 19e:	outs   dx,BYTE PTR ds:[esi]
 19f:	je     0x214
 1a1:	add    DWORD PTR [eax],eax
 1a3:	adc    eax,0x4c294428
 1a8:	push   0x61
 1aa:	jbe    0x20d
 1ac:	das    
 1ad:	ins    BYTE PTR es:[edi],dx
 1ae:	popa   
 1af:	outs   dx,BYTE PTR ds:[esi]
 1b0:	addr16 das 
 1b2:	push   ebx
 1b3:	je     0x227
 1b5:	imul   ebp,DWORD PTR [esi+0x67],0x2e00073b
 1bc:	or     al,0x0
 1be:	sub    al,BYTE PTR [eax]
 1c0:	xor    al,BYTE PTR [ecx]
 1c2:	add    BYTE PTR [edx+ebp*2],ah
 1c5:	popa   
 1c6:	jbe    0x229
 1c8:	das    
 1c9:	ins    BYTE PTR es:[edi],dx
 1ca:	popa   
 1cb:	outs   dx,BYTE PTR ds:[esi]
 1cc:	addr16 das 
 1ce:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 1d5:	push   ebx
 1d6:	je     0x24a
 1d8:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 1df:	popa   
 1e0:	je     0x228
 1e2:	popa   
 1e3:	arpl   WORD PTR [edi+ebp*2+0x72],si
 1e7:	jns    0x1f0
 1e9:	add    BYTE PTR [ecx+eax*1],dh
 1ec:	add    BYTE PTR [esi],al
 1ee:	dec    esp
 1ef:	outs   dx,DWORD PTR ds:[esi]
 1f0:	outs   dx,DWORD PTR ds:[esi]
 1f1:	imul   esi,DWORD PTR [ebp+0x70],0x1
 1f5:	add    BYTE PTR [ecx+ecx*2],cl
 1f8:	outs   dx,BYTE PTR ds:[esi]
 1f9:	outs   dx,BYTE PTR ds:[esi]
 1fa:	gs jb  0x240
 1fd:	ins    BYTE PTR es:[edi],dx
 1fe:	popa   
 1ff:	jae    0x274
 201:	gs jae 0x205
 204:	add    BYTE PTR [eax+0x616a4c28],bl
 20a:	jbe    0x26d
 20c:	das    
 20d:	ins    BYTE PTR es:[edi],dx
 20e:	popa   
 20f:	outs   dx,BYTE PTR ds:[esi]
 210:	addr16 das 
 212:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 219:	dec    ebp
 21a:	gs je  0x285
 21d:	outs   dx,DWORD PTR ds:[esi]
 21e:	fs dec eax
 220:	popa   
 221:	outs   dx,BYTE PTR ds:[esi]
 222:	fs ins BYTE PTR es:[edi],dx
 224:	gs jae 0x24b
 227:	dec    esp
 228:	outs   dx,DWORD PTR ds:[esi]
 229:	outs   dx,DWORD PTR ds:[esi]
 22a:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 22e:	dec    esp
 22f:	push   0x61
 231:	jbe    0x294
 233:	das    
 234:	ins    BYTE PTR es:[edi],dx
 235:	popa   
 236:	outs   dx,BYTE PTR ds:[esi]
 237:	addr16 das 
 239:	push   ebx
 23a:	je     0x2ae
 23c:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 243:	jbe    0x2a6
 245:	das    
 246:	ins    BYTE PTR es:[edi],dx
 247:	popa   
 248:	outs   dx,BYTE PTR ds:[esi]
 249:	addr16 das 
 24b:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 252:	dec    ebp
 253:	gs je  0x2be
 256:	outs   dx,DWORD PTR ds:[esi]
 257:	fs push esp
 259:	jns    0x2cb
 25b:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 260:	jbe    0x2c3
 262:	das    
 263:	ins    BYTE PTR es:[edi],dx
 264:	popa   
 265:	outs   dx,BYTE PTR ds:[esi]
 266:	addr16 das 
 268:	push   ebx
 269:	je     0x2dd
 26b:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 272:	popa   
 273:	jbe    0x2d6
 275:	das    
 276:	ins    BYTE PTR es:[edi],dx
 277:	popa   
 278:	outs   dx,BYTE PTR ds:[esi]
 279:	addr16 das 
 27b:	dec    edi
 27c:	bound  ebp,QWORD PTR [edx+0x65]
 27f:	arpl   WORD PTR [ebx+edi*1+0x29],si
 283:	dec    esp
 284:	push   0x61
 286:	jbe    0x2e9
 288:	das    
 289:	ins    BYTE PTR es:[edi],dx
 28a:	popa   
 28b:	outs   dx,BYTE PTR ds:[esi]
 28c:	addr16 das 
 28e:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 295:	inc    ebx
 296:	popa   
 297:	ins    BYTE PTR es:[edi],dx
 298:	ins    BYTE PTR es:[edi],dx
 299:	push   ebx
 29a:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x1350007
 2a2:	add    BYTE PTR ds:0x6176616a,ah
 2a8:	das    
 2a9:	ins    BYTE PTR es:[edi],dx
 2aa:	popa   
 2ab:	outs   dx,BYTE PTR ds:[esi]
 2ac:	addr16 das 
 2ae:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2b5:	dec    ebp
 2b6:	gs je  0x321
 2b9:	outs   dx,DWORD PTR ds:[esi]
 2ba:	fs dec eax
 2bc:	popa   
 2bd:	outs   dx,BYTE PTR ds:[esi]
 2be:	fs ins BYTE PTR es:[edi],dx
 2c0:	gs jae 0x2e7
 2c3:	dec    esp
 2c4:	outs   dx,DWORD PTR ds:[esi]
 2c5:	outs   dx,DWORD PTR ds:[esi]
 2c6:	imul   esi,DWORD PTR [ebp+0x70],0x1
 2ca:	add    BYTE PTR [esi],bl
 2cc:	push   0x61
 2ce:	jbe    0x331
 2d0:	das    
 2d1:	ins    BYTE PTR es:[edi],dx
 2d2:	popa   
 2d3:	outs   dx,BYTE PTR ds:[esi]
 2d4:	addr16 das 
 2d6:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2dd:	dec    ebp
 2de:	gs je  0x349
 2e1:	outs   dx,DWORD PTR ds:[esi]
 2e2:	fs dec eax
 2e4:	popa   
 2e5:	outs   dx,BYTE PTR ds:[esi]
 2e6:	fs ins BYTE PTR es:[edi],dx
 2e8:	gs jae 0x2eb
 2eb:	and    DWORD PTR [eax],eax
 2ed:	or     BYTE PTR [eax],al
 2ef:	or     DWORD PTR [eax],eax
 2f1:	add    BYTE PTR [eax],al
 2f3:	add    eax,DWORD PTR [eax]
 2f5:	add    BYTE PTR [eax],al
 2f7:	or     al,BYTE PTR [eax]
 2f9:	or     eax,DWORD PTR [eax]
 2fb:	add    BYTE PTR [eax],al
 2fd:	add    BYTE PTR [eax],al
 2ff:	or     al,0x0
 301:	or     eax,DWORD PTR [eax]
 303:	add    BYTE PTR [eax],al
 305:	add    BYTE PTR [eax],al
 307:	or     eax,0xb00
 30c:	add    BYTE PTR [edx],al
 30e:	add    BYTE PTR [ecx],al
 310:	add    BYTE PTR [esi],cl
 312:	add    BYTE PTR [edi],cl
 314:	add    BYTE PTR [ecx],al
 316:	add    BYTE PTR [eax],dl
 318:	add    BYTE PTR [eax],al
 31a:	add    BYTE PTR ds:0x1000100,bl
 320:	add    BYTE PTR [eax],al
 322:	add    BYTE PTR ds:0x100b72a,al
 328:	mov    cl,0x0
 32a:	add    BYTE PTR [eax],al
 32c:	add    DWORD PTR [eax],eax
 32e:	adc    DWORD PTR [eax],eax
 330:	add    BYTE PTR [eax],al
 332:	push   es
 333:	add    BYTE PTR [ecx],al
 335:	add    BYTE PTR [eax],al
 337:	add    BYTE PTR [eax+eax*1],al
 33a:	or     DWORD PTR [eax],eax
 33c:	adc    al,BYTE PTR [eax]
 33e:	adc    eax,DWORD PTR [eax]
 340:	add    DWORD PTR [eax],eax
 342:	adc    BYTE PTR [eax],al
 344:	add    BYTE PTR [eax],al
 346:	mov    WORD PTR [eax],es
 348:	push   es
 349:	add    BYTE PTR [esi],cl
 34b:	add    BYTE PTR [eax],al
 34d:	add    BYTE PTR [eax+edx*1+0x64],cl
 351:	cmp    al,0x1b
 353:	test   DWORD PTR [ecx+0x20],eax
 356:	mov    DWORD PTR [eax],edi
 358:	add    al,0x20
 35a:	mov    bh,BYTE PTR [ecx]
 35c:	add    eax,0x39020014
 361:	pop    es
 362:	sbb    BYTE PTR [edi],al
 364:	(bad)  
 365:	aaa    
 366:	or     DWORD PTR [eax],ebx
 368:	pop    es
 369:	mov    ?,WORD PTR [esi]
 36b:	or     esi,DWORD PTR [edx+0x5120400]
 371:	mov    dh,0x0
 373:	push   es
 374:	sbb    eax,DWORD PTR [ebp+0x188a6120]
 37a:	pop    es
 37b:	pop    ss
 37c:	add    al,0x8d
 37e:	imul   esp,DWORD PTR [ebx+0x16],0x9
 382:	mov    ah,BYTE PTR [ebx+0x18]
 385:	add    eax,0x870b1563
 38a:	arpl   WORD PTR [ecx],di
 38c:	or     al,0xb2
 38e:	add    BYTE PTR [eax+ebx*1],al
 391:	or     al,0xba
 393:	add    BYTE PTR [edi],al
 395:	add    BYTE PTR [eax],al
 397:	mov    dh,0x0
 399:	push   es
 39a:	mov    cl,0x0
 39c:	add    BYTE PTR [eax],al
 39e:	add    DWORD PTR [eax],eax
 3a0:	adc    DWORD PTR [eax],eax
 3a2:	add    BYTE PTR [eax],al
 3a4:	add    BYTE PTR cs:[ebx],cl
 3a7:	add    BYTE PTR [eax],al
 3a9:	add    BYTE PTR [ecx],cl
 3ab:	add    BYTE PTR [ebx],al
 3ad:	add    BYTE PTR [edx],cl
 3af:	add    BYTE PTR [esi],al
 3b1:	add    BYTE PTR [ebx],cl
 3b3:	add    BYTE PTR [edx],cl
 3b5:	add    BYTE PTR [eax+eax*1],cl
 3b8:	push   cs
 3b9:	add    BYTE PTR [esi],cl
 3bb:	add    BYTE PTR [ebx],dl
 3bd:	add    BYTE PTR [edi],cl
 3bf:	add    BYTE PTR [eax],bl
 3c1:	add    BYTE PTR [eax],dl
 3c3:	add    BYTE PTR ds:0x25001200,bl
 3c9:	add    BYTE PTR [eax+eax*1],dl
 3cc:	add    BYTE PTR ds:0x16004b00,dl
 3d3:	add    BYTE PTR [ebx],al
 3d5:	add    BYTE PTR [eax+eax*1],dl
 3d8:	add    BYTE PTR [eax],al
 3da:	add    al,BYTE PTR [eax]
 3dc:	adc    eax,0x3100
 3e1:	add    BYTE PTR [edx],cl
 3e3:	add    BYTE PTR [ecx],al
 3e5:	add    BYTE PTR [edi],ch
 3e7:	add    BYTE PTR [ebx],dh
 3e9:	add    BYTE PTR [eax],dh
 3eb:	add    BYTE PTR [ecx],bl
 3ed:	add    BYTE PTR [eax+eax*1],bl
 3f0:	add    BYTE PTR [eax],al
 3f2:	or     BYTE PTR [eax],al
 3f4:	add    DWORD PTR [eax],eax
 3f6:	sbb    eax,0x1e000100

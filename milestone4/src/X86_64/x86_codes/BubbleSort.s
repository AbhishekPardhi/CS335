
BubbleSort.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [ebx],bh
   a:	or     al,BYTE PTR [eax]
   c:	or     eax,DWORD PTR [eax]
   e:	sbb    BYTE PTR [ecx],cl
  10:	add    BYTE PTR [ecx],bl
  12:	add    BYTE PTR [edx],bl
  14:	adc    al,BYTE PTR [eax]
  16:	add    BYTE PTR [eax],al
  18:	push   ds
  19:	or     al,BYTE PTR [eax]
  1b:	pop    ds
  1c:	add    BYTE PTR [eax],ah
  1e:	or     al,BYTE PTR [eax]
  20:	pop    ds
  21:	add    BYTE PTR [ecx],ah
  23:	pop    es
  24:	add    BYTE PTR [edx],ah
  26:	or     al,BYTE PTR [eax]
  28:	push   es
  29:	add    BYTE PTR [eax],bl
  2b:	or     al,BYTE PTR [eax]
  2d:	push   es
  2e:	add    BYTE PTR [ebx],ah
  30:	or     BYTE PTR [eax],al
  32:	and    al,0xa
  34:	add    BYTE PTR [esi],al
  36:	add    BYTE PTR ds:0x1260007,ah
  3c:	add    BYTE PTR [esi],al
  3e:	cmp    al,0x69
  40:	outs   dx,BYTE PTR ds:[esi]
  41:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  49:	push   esi
  4a:	add    DWORD PTR [eax],eax
  4c:	add    al,0x43
  4e:	outs   dx,DWORD PTR ds:[esi]
  4f:	fs add DWORD PTR gs:[eax],eax
  53:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  57:	gs dec esi
  59:	jne    0xc8
  5b:	bound  esp,QWORD PTR [ebp+0x72]
  5e:	push   esp
  5f:	popa   
  60:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  64:	add    BYTE PTR [edx],cl
  66:	bound  esi,QWORD PTR [ebp+0x62]
  69:	bound  ebp,QWORD PTR [ebp+eiz*2+0x53]
  6d:	outs   dx,DWORD PTR ds:[esi]
  6e:	jb     0xe4
  70:	add    DWORD PTR [eax],eax
  72:	add    eax,0x29495b28
  77:	push   esi
  78:	add    DWORD PTR [eax],eax
  7a:	or     eax,0x63617453
  7f:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  83:	push   esp
  84:	popa   
  85:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  89:	add    BYTE PTR [edx],cl
  8b:	jo     0xff
  8d:	imul   ebp,DWORD PTR [esi+0x74],0x61727241
  94:	jns    0x97
  96:	add    BYTE PTR [ebp*2+0x16e6961],al
  9d:	add    BYTE PTR [esi],dl
  9f:	sub    BYTE PTR [ebx+0x4c],bl
  a2:	push   0x61
  a4:	jbe    0x107
  a6:	das    
  a7:	ins    BYTE PTR es:[edi],dx
  a8:	popa   
  a9:	outs   dx,BYTE PTR ds:[esi]
  aa:	addr16 das 
  ac:	push   ebx
  ad:	je     0x121
  af:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  b6:	add    BYTE PTR [edx],cl
  b8:	push   ebx
  b9:	outs   dx,DWORD PTR ds:[esi]
  ba:	jne    0x12e
  bc:	arpl   WORD PTR [ebp+0x46],sp
  bf:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x75420f00
  c7:	bound  esp,QWORD PTR [edx+0x6c]
  ca:	gs push ebx
  cc:	outs   dx,DWORD PTR ds:[esi]
  cd:	jb     0x143
  cf:	cs push 0x61
  d2:	jbe    0x135
  d4:	or     al,0x0
  d6:	or     al,0x0
  d8:	or     eax,0xc270007
  dd:	add    BYTE PTR [eax],ch
  df:	add    BYTE PTR [ecx],ch
  e1:	add    DWORD PTR [eax],eax
  e3:	adc    BYTE PTR [edx+0x6f],al
  e6:	outs   dx,DWORD PTR ds:[esi]
  e7:	je     0x15c
  e9:	je     0x15d
  eb:	popa   
  ec:	jo     0x13b
  ee:	gs je  0x159
  f1:	outs   dx,DWORD PTR ds:[esi]
  f2:	fs jae 0x104
  f5:	push   es
  f6:	add    BYTE PTR [edx],ch
  f8:	or     BYTE PTR [eax],al
  fa:	sub    ecx,DWORD PTR [eax+eax*1]
  fd:	sub    al,0x0
  ff:	sub    eax,0xc2e0007
 104:	add    BYTE PTR [edi],ch
 106:	add    BYTE PTR [eax],dh
 108:	or     al,0x0
 10a:	das    
 10b:	add    BYTE PTR ds:0x420a0001,cl
 111:	jne    0x175
 113:	bound  ebp,QWORD PTR [ebp+eiz*2+0x53]
 117:	outs   dx,DWORD PTR ds:[esi]
 118:	jb     0x18e
 11a:	or     al,0x0
 11c:	adc    BYTE PTR [eax],al
 11e:	adc    DWORD PTR [ecx],eax
 120:	add    BYTE PTR [ebx+edx*2],cl
 123:	outs   dx,DWORD PTR ds:[esi]
 124:	jb     0x19a
 126:	gs and BYTE PTR fs:[ecx+0x72],ah
 12b:	jb     0x18e
 12d:	jns    0x13b
 12f:	add    BYTE PTR [ebx],dl
 131:	add    BYTE PTR [ecx],dl
 133:	add    DWORD PTR [eax],eax
 135:	adc    BYTE PTR [edx+0x61],ch
 138:	jbe    0x19b
 13a:	das    
 13b:	ins    BYTE PTR es:[edi],dx
 13c:	popa   
 13d:	outs   dx,BYTE PTR ds:[esi]
 13e:	addr16 das 
 140:	dec    edi
 141:	bound  ebp,QWORD PTR [edx+0x65]
 144:	arpl   WORD PTR [ecx+eax*1+0x0],si
 148:	adc    BYTE PTR [edx+0x61],ch
 14b:	jbe    0x1ae
 14d:	das    
 14e:	ins    BYTE PTR es:[edi],dx
 14f:	popa   
 150:	outs   dx,BYTE PTR ds:[esi]
 151:	addr16 das 
 153:	push   ebx
 154:	jns    0x1c9
 156:	je     0x1bd
 158:	ins    DWORD PTR es:[edi],dx
 159:	add    DWORD PTR [eax],eax
 15b:	add    ebp,DWORD PTR [edi+0x75]
 15e:	je     0x161
 160:	add    BYTE PTR ds:0x76616a4c,dl
 166:	popa   
 167:	das    
 168:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 16f:	je     0x1c4
 171:	je     0x1e5
 173:	gs popa 
 175:	ins    DWORD PTR es:[edi],dx
 176:	cmp    ecx,DWORD PTR [edx]
 178:	add    BYTE PTR [ecx],dh
 17a:	add    BYTE PTR [edx],dh
 17c:	add    DWORD PTR [eax],eax
 17e:	add    al,BYTE PTR [ecx]
 180:	and    BYTE PTR [ecx],al
 182:	add    BYTE PTR [edi],dl
 184:	ins    DWORD PTR es:[edi],dx
 185:	popa   
 186:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 18a:	outs   dx,BYTE PTR ds:[esi]
 18b:	arpl   WORD PTR [ecx+0x74],sp
 18e:	push   edi
 18f:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 197:	popa   
 198:	outs   dx,BYTE PTR ds:[esi]
 199:	je     0x20e
 19b:	add    DWORD PTR [eax],eax
 19d:	adc    eax,0x4c294928
 1a2:	push   0x61
 1a4:	jbe    0x207
 1a6:	das    
 1a7:	ins    BYTE PTR es:[edi],dx
 1a8:	popa   
 1a9:	outs   dx,BYTE PTR ds:[esi]
 1aa:	addr16 das 
 1ac:	push   ebx
 1ad:	je     0x221
 1af:	imul   ebp,DWORD PTR [esi+0x67],0x1300013b
 1b6:	push   0x61
 1b8:	jbe    0x21b
 1ba:	das    
 1bb:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 1c2:	je     0x217
 1c4:	je     0x238
 1c6:	gs popa 
 1c8:	ins    DWORD PTR es:[edi],dx
 1c9:	add    DWORD PTR [eax],eax
 1cb:	pop    es
 1cc:	jo     0x240
 1ce:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 1d5:	adc    eax,0x616a4c28
 1da:	jbe    0x23d
 1dc:	das    
 1dd:	ins    BYTE PTR es:[edi],dx
 1de:	popa   
 1df:	outs   dx,BYTE PTR ds:[esi]
 1e0:	addr16 das 
 1e2:	push   ebx
 1e3:	je     0x257
 1e5:	imul   ebp,DWORD PTR [esi+0x67],0x756293b
 1ec:	add    BYTE PTR [ebx],dh
 1ee:	or     al,0x0
 1f0:	sub    al,0x0
 1f2:	aaa    
 1f3:	add    DWORD PTR [eax],eax
 1f5:	and    al,0x6a
 1f7:	popa   
 1f8:	jbe    0x25b
 1fa:	das    
 1fb:	ins    BYTE PTR es:[edi],dx
 1fc:	popa   
 1fd:	outs   dx,BYTE PTR ds:[esi]
 1fe:	addr16 das 
 200:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 207:	push   ebx
 208:	je     0x27c
 20a:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 211:	popa   
 212:	je     0x25a
 214:	popa   
 215:	arpl   WORD PTR [edi+ebp*2+0x72],si
 219:	jns    0x222
 21b:	add    BYTE PTR [ecx],bh
 21d:	add    DWORD PTR [eax],eax
 21f:	push   es
 220:	dec    esp
 221:	outs   dx,DWORD PTR ds:[esi]
 222:	outs   dx,DWORD PTR ds:[esi]
 223:	imul   esi,DWORD PTR [ebp+0x70],0x1
 227:	add    BYTE PTR [ecx+ecx*2],cl
 22a:	outs   dx,BYTE PTR ds:[esi]
 22b:	outs   dx,BYTE PTR ds:[esi]
 22c:	gs jb  0x272
 22f:	ins    BYTE PTR es:[edi],dx
 230:	popa   
 231:	jae    0x2a6
 233:	gs jae 0x237
 236:	add    BYTE PTR [eax+0x616a4c28],bl
 23c:	jbe    0x29f
 23e:	das    
 23f:	ins    BYTE PTR es:[edi],dx
 240:	popa   
 241:	outs   dx,BYTE PTR ds:[esi]
 242:	addr16 das 
 244:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 24b:	dec    ebp
 24c:	gs je  0x2b7
 24f:	outs   dx,DWORD PTR ds:[esi]
 250:	fs dec eax
 252:	popa   
 253:	outs   dx,BYTE PTR ds:[esi]
 254:	fs ins BYTE PTR es:[edi],dx
 256:	gs jae 0x27d
 259:	dec    esp
 25a:	outs   dx,DWORD PTR ds:[esi]
 25b:	outs   dx,DWORD PTR ds:[esi]
 25c:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 260:	dec    esp
 261:	push   0x61
 263:	jbe    0x2c6
 265:	das    
 266:	ins    BYTE PTR es:[edi],dx
 267:	popa   
 268:	outs   dx,BYTE PTR ds:[esi]
 269:	addr16 das 
 26b:	push   ebx
 26c:	je     0x2e0
 26e:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 275:	jbe    0x2d8
 277:	das    
 278:	ins    BYTE PTR es:[edi],dx
 279:	popa   
 27a:	outs   dx,BYTE PTR ds:[esi]
 27b:	addr16 das 
 27d:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 284:	dec    ebp
 285:	gs je  0x2f0
 288:	outs   dx,DWORD PTR ds:[esi]
 289:	fs push esp
 28b:	jns    0x2fd
 28d:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 292:	jbe    0x2f5
 294:	das    
 295:	ins    BYTE PTR es:[edi],dx
 296:	popa   
 297:	outs   dx,BYTE PTR ds:[esi]
 298:	addr16 das 
 29a:	push   ebx
 29b:	je     0x30f
 29d:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 2a4:	popa   
 2a5:	jbe    0x308
 2a7:	das    
 2a8:	ins    BYTE PTR es:[edi],dx
 2a9:	popa   
 2aa:	outs   dx,BYTE PTR ds:[esi]
 2ab:	addr16 das 
 2ad:	dec    edi
 2ae:	bound  ebp,QWORD PTR [edx+0x65]
 2b1:	arpl   WORD PTR [ebx+edi*1+0x29],si
 2b5:	dec    esp
 2b6:	push   0x61
 2b8:	jbe    0x31b
 2ba:	das    
 2bb:	ins    BYTE PTR es:[edi],dx
 2bc:	popa   
 2bd:	outs   dx,BYTE PTR ds:[esi]
 2be:	addr16 das 
 2c0:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2c7:	inc    ebx
 2c8:	popa   
 2c9:	ins    BYTE PTR es:[edi],dx
 2ca:	ins    BYTE PTR es:[edi],dx
 2cb:	push   ebx
 2cc:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x13a0007
 2d4:	add    BYTE PTR ds:0x6176616a,ah
 2da:	das    
 2db:	ins    BYTE PTR es:[edi],dx
 2dc:	popa   
 2dd:	outs   dx,BYTE PTR ds:[esi]
 2de:	addr16 das 
 2e0:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2e7:	dec    ebp
 2e8:	gs je  0x353
 2eb:	outs   dx,DWORD PTR ds:[esi]
 2ec:	fs dec eax
 2ee:	popa   
 2ef:	outs   dx,BYTE PTR ds:[esi]
 2f0:	fs ins BYTE PTR es:[edi],dx
 2f2:	gs jae 0x319
 2f5:	dec    esp
 2f6:	outs   dx,DWORD PTR ds:[esi]
 2f7:	outs   dx,DWORD PTR ds:[esi]
 2f8:	imul   esi,DWORD PTR [ebp+0x70],0x1
 2fc:	add    BYTE PTR [esi],bl
 2fe:	push   0x61
 300:	jbe    0x363
 302:	das    
 303:	ins    BYTE PTR es:[edi],dx
 304:	popa   
 305:	outs   dx,BYTE PTR ds:[esi]
 306:	addr16 das 
 308:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 30f:	dec    ebp
 310:	gs je  0x37b
 313:	outs   dx,DWORD PTR ds:[esi]
 314:	fs dec eax
 316:	popa   
 317:	outs   dx,BYTE PTR ds:[esi]
 318:	fs ins BYTE PTR es:[edi],dx
 31a:	gs jae 0x31d
 31d:	and    BYTE PTR [eax],al
 31f:	push   es
 320:	add    BYTE PTR [ebx],cl
 322:	add    BYTE PTR [eax],al
 324:	add    BYTE PTR [eax],al
 326:	add    BYTE PTR [eax+eax*1],al
 329:	add    BYTE PTR [eax],al
 32b:	or     al,0x0
 32d:	or     eax,0xe000100
 332:	add    BYTE PTR [eax],al
 334:	add    BYTE PTR ds:0x1000100,bl
 33a:	add    BYTE PTR [eax],al
 33c:	add    BYTE PTR ds:0x100b72a,al
 342:	mov    cl,0x0
 344:	add    BYTE PTR [eax],al
 346:	add    DWORD PTR [eax],eax
 348:	sldt   WORD PTR [eax]
 34b:	add    BYTE PTR [esi],al
 34d:	add    BYTE PTR [ecx],al
 34f:	add    BYTE PTR [eax],al
 351:	add    BYTE PTR ds:0x10000000,al
 357:	add    BYTE PTR [ecx],dl
 359:	add    BYTE PTR [ecx],al
 35b:	add    BYTE PTR [esi],cl
 35d:	add    BYTE PTR [eax],al
 35f:	add    BYTE PTR [esi+0x6000500],bl
 365:	add    BYTE PTR [eax],al
 367:	add    BYTE PTR [edx+0x8],cl
 36a:	cmp    eax,0x1c1d3e03
 36f:	add    al,0x64
 371:	mov    ds:0x36034100,al
 376:	add    al,0x15
 378:	add    al,0x1c
 37a:	sbb    eax,0xa2640464
 37f:	add    BYTE PTR [esi],ch
 381:	sub    edx,DWORD PTR ds:0x152b2e04
 387:	add    al,0x4
 389:	pusha  
 38a:	movs   BYTE PTR es:[edi],BYTE PTR cs:[esi]
 38c:	add    BYTE PTR [ebx],bl
 38e:	sub    edx,DWORD PTR ds:0x5362e04
 394:	sub    edx,DWORD PTR ds:0x4152b04
 39a:	add    al,0x60
 39c:	cs dec edi
 39e:	sub    edx,DWORD PTR ds:0x15600404
 3a4:	add    eax,0x104844f
 3a9:	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3aa:	dec    esi
 3ac:	test   BYTE PTR [ebx],al
 3ae:	add    DWORD PTR [edi+0xb1beff],esp
 3b4:	add    BYTE PTR [eax],al
 3b6:	add    al,BYTE PTR [eax]
 3b8:	sldt   WORD PTR [eax]
 3bb:	add    BYTE PTR [edx],ch
 3bd:	add    BYTE PTR [edx],cl
 3bf:	add    BYTE PTR [eax],al
 3c1:	add    BYTE PTR [eax],cl
 3c3:	add    BYTE PTR [edx],al
 3c5:	add    BYTE PTR [ecx],cl
 3c7:	add    BYTE PTR [ebx],cl
 3c9:	add    BYTE PTR [edx],cl
 3cb:	add    BYTE PTR [eax],bl
 3cd:	add    BYTE PTR [ebx],cl
 3cf:	add    BYTE PTR ds:0x2b000d00,ah
 3d5:	add    BYTE PTR [esi],cl
 3d7:	add    BYTE PTR ds:0x3d000f00,dh
 3dd:	add    BYTE PTR [edx],cl
 3df:	add    BYTE PTR [ebx+0x0],al
 3e2:	or     DWORD PTR [eax],eax
 3e4:	dec    ecx
 3e5:	add    BYTE PTR [ebx],dl
 3e7:	add    BYTE PTR [edx],dl
 3e9:	add    BYTE PTR [eax],al
 3eb:	add    BYTE PTR [edx],dl
 3ed:	add    BYTE PTR ds:0x10400fd,al
 3f3:	add    esp,edi
 3f5:	add    BYTE PTR [ecx],cl
 3f7:	add    DWORD PTR [esi],ebp
 3f9:	cli    
 3fa:	add    BYTE PTR ds:0x500fa,al
 400:	add    BYTE PTR [eax],al
 402:	adc    eax,DWORD PTR [eax]
 404:	adc    DWORD PTR [eax],eax
 406:	add    DWORD PTR [eax],eax
 408:	push   cs
 409:	add    BYTE PTR [eax],al
 40b:	add    BYTE PTR [eax+0x0],ah
 40e:	add    eax,DWORD PTR [eax]
 410:	add    al,0x0
 412:	add    BYTE PTR [eax],al
 414:	and    al,0x8
 416:	cmp    eax,0x1c1d3e03
 41b:	mov    ds:0xb21700,al
 420:	add    ch,BYTE PTR [ebx]
 422:	sbb    eax,0x300ba2e
 427:	add    BYTE PTR [eax],al
 429:	mov    dh,0x0
 42b:	add    al,0x84
 42d:	add    eax,DWORD PTR [ecx]
 42f:	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 430:	(bad)  
 431:	jmp    0x500:0xb60200b2
 438:	mov    cl,0x0
 43a:	add    BYTE PTR [eax],al
 43c:	add    al,BYTE PTR [eax]
 43e:	sldt   WORD PTR [eax]
 441:	add    BYTE PTR [edx],bl
 443:	add    BYTE PTR [esi],al
 445:	add    BYTE PTR [eax],al
 447:	add    BYTE PTR [eax],bl
 449:	add    BYTE PTR [edx],al
 44b:	add    BYTE PTR [ecx],bl
 44d:	add    BYTE PTR [ecx],cl
 44f:	add    BYTE PTR [edx],bl
 451:	add    BYTE PTR [edi],dl
 453:	add    BYTE PTR [ecx],bl
 455:	add    BYTE PTR ds:0x23001b00,bl
 45b:	add    BYTE PTR [eax+eax*1],bl
 45e:	adc    al,BYTE PTR [eax]
 460:	add    BYTE PTR [eax],al
 462:	or     al,BYTE PTR [eax]
 464:	add    bh,ch
 466:	add    BYTE PTR [ecx+eax*1],al
 469:	add    edx,edi
 46b:	add    BYTE PTR [eax],bl
 46d:	add    BYTE PTR [ecx],cl
 46f:	add    BYTE PTR [eax+eax*1],dl
 472:	adc    eax,0xe000100
 477:	add    BYTE PTR [eax],al
 479:	add    BYTE PTR [eax+eax*1+0x3],dh
 47d:	add    BYTE PTR [ebx],al
 47f:	add    BYTE PTR [eax],al
 481:	add    BYTE PTR [ebx+edi*4],dh
 484:	add    BYTE PTR [esi],al
 486:	pop    ecx
 487:	mov    bh,0x0
 489:	pop    es
 48a:	dec    esp
 48b:	or     BYTE PTR [edx+ecx*1+0x8032c4d],bh
 492:	dec    edi
 493:	sub    al,0x4
 495:	add    al,0x4f
 497:	sub    al,0x5
 499:	pop    es
 49a:	dec    edi
 49b:	sub    al,0x6
 49d:	add    eax,0x10072c4f
 4a2:	or     BYTE PTR [edi+0x2b],cl
 4a5:	sub    al,0xb6
 4a7:	add    BYTE PTR [eax],cl
 4a9:	mov    dl,0x0
 4ab:	add    dl,BYTE PTR [edx]
 4ad:	or     DWORD PTR [esi+0x2c2b0400],esi
 4b3:	mov    dh,0x0
 4b5:	or     dh,BYTE PTR [ecx+0x1000000]
 4bb:	add    BYTE PTR [edi],cl
 4bd:	add    BYTE PTR [eax],al
 4bf:	add    BYTE PTR [esi],ch
 4c1:	add    BYTE PTR [ebx],cl
 4c3:	add    BYTE PTR [eax],al
 4c5:	add    BYTE PTR [ecx],ah
 4c7:	add    BYTE PTR [eax],cl
 4c9:	add    BYTE PTR [edx],ah
 4cb:	add    BYTE PTR [eax+eax*1],cl
 4ce:	and    eax,DWORD PTR [eax]
 4d0:	adc    BYTE PTR [eax],al
 4d2:	and    al,0x0
 4d4:	adc    al,0x0
 4d6:	and    eax,0x26001800
 4db:	add    BYTE PTR [eax+eax*1],bl
 4de:	daa    
 4df:	add    BYTE PTR [ecx],ah
 4e1:	add    BYTE PTR [ecx],ch
 4e3:	add    BYTE PTR [esi],ah
 4e5:	add    BYTE PTR [edx],ch
 4e7:	add    BYTE PTR [esi],ch
 4e9:	add    BYTE PTR [ebx],ch
 4eb:	add    BYTE PTR [ebx],dh
 4ed:	add    BYTE PTR [eax+eax*1],ch
 4f0:	add    eax,DWORD PTR [eax]
 4f2:	push   ss
 4f3:	add    BYTE PTR [eax],al
 4f5:	add    BYTE PTR [edx],al
 4f7:	add    BYTE PTR [edi],dl
 4f9:	add    BYTE PTR [esi],dh
 4fb:	add    BYTE PTR [eax],al
 4fd:	add    BYTE PTR [edx],cl
 4ff:	add    BYTE PTR [ecx],al
 501:	add    BYTE PTR [eax+eax*1],dh
 504:	cmp    BYTE PTR [eax],al
 506:	xor    eax,0x1b001900
 50b:	add    BYTE PTR [eax],al
 50d:	add    BYTE PTR [eax],cl
 50f:	add    BYTE PTR [ecx],al
 511:	add    BYTE PTR [eax+eax*1],bl
 514:	add    DWORD PTR [eax],eax
 516:	.byte 0x1d

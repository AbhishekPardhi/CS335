
MergeSort.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [ebx+0xa],cl
   b:	add    BYTE PTR [edi],cl
   d:	add    BYTE PTR [ebx],ah
   f:	add    eax,DWORD PTR [eax]
  11:	cmovb  eax,DWORD PTR [eax+0x9]
  15:	add    BYTE PTR [eax+eax*1],cl
  18:	and    al,0xa
  1a:	add    BYTE PTR [eax+eax*1],cl
  1d:	and    eax,0xc000a
  22:	or     DWORD PTR es:[eax],eax
  25:	daa    
  26:	add    BYTE PTR [eax],ch
  28:	adc    al,BYTE PTR [eax]
  2a:	add    BYTE PTR [eax],al
  2c:	sub    al,0xa
  2e:	add    BYTE PTR ds:0xa2e00,ch
  34:	sub    eax,0x82f00
  39:	xor    BYTE PTR [edx],cl
  3b:	add    BYTE PTR [eax+eax*1],cl
  3e:	xor    DWORD PTR [edi],eax
  40:	add    BYTE PTR [edx],dh
  42:	or     al,BYTE PTR [eax]
  44:	or     al,0x0
  46:	and    ecx,DWORD PTR [eax]
  48:	add    BYTE PTR [ebx],dh
  4a:	pop    es
  4b:	add    BYTE PTR [ecx+eax*1],dh
  4e:	add    BYTE PTR [ebx],al
  50:	dec    ebp
  51:	inc    ecx
  52:	pop    eax
  53:	add    DWORD PTR [eax],eax
  55:	add    DWORD PTR [ecx+0x1],ecx
  58:	add    BYTE PTR ds:0x736e6f43,cl
  5e:	je     0xc1
  60:	outs   dx,BYTE PTR ds:[esi]
  61:	je     0xb9
  63:	popa   
  64:	ins    BYTE PTR es:[edi],dx
  65:	jne    0xcc
  67:	add    DWORD PTR [eax],eax
  69:	push   es
  6a:	cmp    al,0x69
  6c:	outs   dx,BYTE PTR ds:[esi]
  6d:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  75:	push   esi
  76:	add    DWORD PTR [eax],eax
  78:	add    al,0x43
  7a:	outs   dx,DWORD PTR ds:[esi]
  7b:	fs add DWORD PTR gs:[eax],eax
  7f:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  83:	gs dec esi
  85:	jne    0xf4
  87:	bound  esp,QWORD PTR [ebp+0x72]
  8a:	push   esp
  8b:	popa   
  8c:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  90:	add    BYTE PTR ds:0x6772656d,al
  96:	add    DWORD PTR gs:[eax],eax
  99:	or     BYTE PTR [eax],ch
  9b:	pop    ebx
  9c:	dec    ecx
  9d:	dec    ecx
  9e:	dec    ecx
  9f:	dec    ecx
  a0:	sub    DWORD PTR [esi+0x1],edx
  a3:	add    BYTE PTR ds:0x63617453,cl
  a9:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  ad:	push   esp
  ae:	popa   
  af:	bound  ebp,QWORD PTR [ebp+eiz*2+0x7]
  b3:	add    BYTE PTR ds:0x73040001,dh
  b9:	outs   dx,DWORD PTR ds:[esi]
  ba:	jb     0x130
  bc:	add    DWORD PTR [eax],eax
  be:	pop    es
  bf:	sub    BYTE PTR [ebx+0x49],bl
  c2:	dec    ecx
  c3:	dec    ecx
  c4:	sub    DWORD PTR [esi+0x1],edx
  c7:	add    BYTE PTR [edx],cl
  c9:	jo     0x13d
  cb:	imul   ebp,DWORD PTR [esi+0x74],0x61727241
  d2:	jns    0xd5
  d4:	add    BYTE PTR ds:0x29495b28,al
  da:	push   esi
  db:	add    DWORD PTR [eax],eax
  dd:	add    al,0x6d
  df:	popa   
  e0:	imul   ebp,DWORD PTR [esi+0x1],0x5b281600
  e7:	dec    esp
  e8:	push   0x61
  ea:	jbe    0x14d
  ec:	das    
  ed:	ins    BYTE PTR es:[edi],dx
  ee:	popa   
  ef:	outs   dx,BYTE PTR ds:[esi]
  f0:	addr16 das 
  f2:	push   ebx
  f3:	je     0x167
  f5:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  fc:	add    BYTE PTR [edx],cl
  fe:	push   ebx
  ff:	outs   dx,DWORD PTR ds:[esi]
 100:	jne    0x174
 102:	arpl   WORD PTR [ebp+0x46],sp
 105:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x654d0e00
 10d:	jb     0x176
 10f:	gs push ebx
 111:	outs   dx,DWORD PTR ds:[esi]
 112:	jb     0x188
 114:	cs push 0x61
 117:	jbe    0x17a
 119:	or     al,0x0
 11b:	adc    eax,DWORD PTR [eax]
 11d:	adc    al,0xc
 11f:	add    BYTE PTR [eax],dl
 121:	add    BYTE PTR [ecx],dl
 123:	or     al,0x0
 125:	sbb    eax,DWORD PTR [eax]
 127:	sbb    al,0xc
 129:	add    BYTE PTR [edi],dl
 12b:	add    BYTE PTR [eax],bl
 12d:	pop    es
 12e:	add    BYTE PTR [esi],dh
 130:	or     al,0x0
 132:	aaa    
 133:	add    BYTE PTR [eax],bh
 135:	add    DWORD PTR [eax],eax
 137:	adc    BYTE PTR [edx+0x6f],al
 13a:	outs   dx,DWORD PTR ds:[esi]
 13b:	je     0x1b0
 13d:	je     0x1b1
 13f:	popa   
 140:	jo     0x18f
 142:	gs je  0x1ad
 145:	outs   dx,DWORD PTR ds:[esi]
 146:	fs jae 0x158
 149:	push   es
 14a:	add    BYTE PTR [ecx],bh
 14c:	or     BYTE PTR [eax],al
 14e:	cmp    cl,BYTE PTR [eax+eax*1]
 151:	cmp    eax,DWORD PTR [eax]
 153:	cmp    al,0x7
 155:	add    BYTE PTR ds:0x3e000c,bh
 15b:	aas    
 15c:	or     al,0x0
 15e:	add    BYTE PTR ds:[eax+0x1],al
 162:	add    BYTE PTR [ebx],cl
 164:	inc    edi
 165:	imul   esi,DWORD PTR [esi+0x65],0x7241206e
 16c:	jb     0x1cf
 16e:	jns    0x17c
 170:	add    BYTE PTR ds:0x11e00,bl
 176:	or     DWORD PTR [ebp+0x65],ecx
 179:	jb     0x1e2
 17b:	gs push ebx
 17d:	outs   dx,DWORD PTR ds:[esi]
 17e:	jb     0x1f4
 180:	add    DWORD PTR [eax],eax
 182:	or     eax,0x726f530a
 187:	je     0x1ee
 189:	and    BYTE PTR fs:[ecx+0x72],ah
 18d:	jb     0x1f0
 18f:	jns    0x192
 191:	add    BYTE PTR [eax],dl
 193:	push   0x61
 195:	jbe    0x1f8
 197:	das    
 198:	ins    BYTE PTR es:[edi],dx
 199:	popa   
 19a:	outs   dx,BYTE PTR ds:[esi]
 19b:	addr16 das 
 19d:	dec    edi
 19e:	bound  ebp,QWORD PTR [edx+0x65]
 1a1:	arpl   WORD PTR [ecx+eax*1+0x0],si
 1a5:	add    bl,BYTE PTR [ebx+0x49]
 1a8:	add    DWORD PTR [eax],eax
 1aa:	adc    BYTE PTR [edx+0x61],ch
 1ad:	jbe    0x210
 1af:	das    
 1b0:	ins    BYTE PTR es:[edi],dx
 1b1:	popa   
 1b2:	outs   dx,BYTE PTR ds:[esi]
 1b3:	addr16 das 
 1b5:	push   ebx
 1b6:	jns    0x22b
 1b8:	je     0x21f
 1ba:	ins    DWORD PTR es:[edi],dx
 1bb:	add    DWORD PTR [eax],eax
 1bd:	add    ebp,DWORD PTR [edi+0x75]
 1c0:	je     0x1c3
 1c2:	add    BYTE PTR ds:0x76616a4c,dl
 1c8:	popa   
 1c9:	das    
 1ca:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 1d1:	je     0x226
 1d3:	je     0x247
 1d5:	gs popa 
 1d7:	ins    DWORD PTR es:[edi],dx
 1d8:	cmp    ecx,DWORD PTR [edx]
 1da:	add    BYTE PTR [ecx+0x0],al
 1dd:	inc    edx
 1de:	add    DWORD PTR [eax],eax
 1e0:	add    al,BYTE PTR [ecx]
 1e2:	and    BYTE PTR [ecx],al
 1e4:	add    BYTE PTR [edi],dl
 1e6:	ins    DWORD PTR es:[edi],dx
 1e7:	popa   
 1e8:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 1ec:	outs   dx,BYTE PTR ds:[esi]
 1ed:	arpl   WORD PTR [ecx+0x74],sp
 1f0:	push   edi
 1f1:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 1f9:	popa   
 1fa:	outs   dx,BYTE PTR ds:[esi]
 1fb:	je     0x270
 1fd:	add    DWORD PTR [eax],eax
 1ff:	adc    eax,0x4c294928
 204:	push   0x61
 206:	jbe    0x269
 208:	das    
 209:	ins    BYTE PTR es:[edi],dx
 20a:	popa   
 20b:	outs   dx,BYTE PTR ds:[esi]
 20c:	addr16 das 
 20e:	push   ebx
 20f:	je     0x283
 211:	imul   ebp,DWORD PTR [esi+0x67],0x1300013b
 218:	push   0x61
 21a:	jbe    0x27d
 21c:	das    
 21d:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 224:	je     0x279
 226:	je     0x29a
 228:	gs popa 
 22a:	ins    DWORD PTR es:[edi],dx
 22b:	add    DWORD PTR [eax],eax
 22d:	pop    es
 22e:	jo     0x2a2
 230:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 237:	adc    eax,0x616a4c28
 23c:	jbe    0x29f
 23e:	das    
 23f:	ins    BYTE PTR es:[edi],dx
 240:	popa   
 241:	outs   dx,BYTE PTR ds:[esi]
 242:	addr16 das 
 244:	push   ebx
 245:	je     0x2b9
 247:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
 24e:	add    BYTE PTR [eax+ebp*1],al
 251:	dec    ecx
 252:	sub    DWORD PTR [esi+0x7],edx
 255:	add    BYTE PTR [ebx+0xc],al
 258:	add    BYTE PTR [ebx],bh
 25a:	add    BYTE PTR [edi+0x1],al
 25d:	add    BYTE PTR [edx+ebp*2],ah
 260:	popa   
 261:	jbe    0x2c4
 263:	das    
 264:	ins    BYTE PTR es:[edi],dx
 265:	popa   
 266:	outs   dx,BYTE PTR ds:[esi]
 267:	addr16 das 
 269:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 270:	push   ebx
 271:	je     0x2e5
 273:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 27a:	popa   
 27b:	je     0x2c3
 27d:	popa   
 27e:	arpl   WORD PTR [edi+ebp*2+0x72],si
 282:	jns    0x28b
 284:	add    BYTE PTR [ecx+0x1],cl
 287:	add    BYTE PTR [esi],al
 289:	dec    esp
 28a:	outs   dx,DWORD PTR ds:[esi]
 28b:	outs   dx,DWORD PTR ds:[esi]
 28c:	imul   esi,DWORD PTR [ebp+0x70],0x1
 290:	add    BYTE PTR [ecx+ecx*2],cl
 293:	outs   dx,BYTE PTR ds:[esi]
 294:	outs   dx,BYTE PTR ds:[esi]
 295:	gs jb  0x2db
 298:	ins    BYTE PTR es:[edi],dx
 299:	popa   
 29a:	jae    0x30f
 29c:	gs jae 0x2a0
 29f:	add    BYTE PTR [eax+0x616a4c28],bl
 2a5:	jbe    0x308
 2a7:	das    
 2a8:	ins    BYTE PTR es:[edi],dx
 2a9:	popa   
 2aa:	outs   dx,BYTE PTR ds:[esi]
 2ab:	addr16 das 
 2ad:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2b4:	dec    ebp
 2b5:	gs je  0x320
 2b8:	outs   dx,DWORD PTR ds:[esi]
 2b9:	fs dec eax
 2bb:	popa   
 2bc:	outs   dx,BYTE PTR ds:[esi]
 2bd:	fs ins BYTE PTR es:[edi],dx
 2bf:	gs jae 0x2e6
 2c2:	dec    esp
 2c3:	outs   dx,DWORD PTR ds:[esi]
 2c4:	outs   dx,DWORD PTR ds:[esi]
 2c5:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 2c9:	dec    esp
 2ca:	push   0x61
 2cc:	jbe    0x32f
 2ce:	das    
 2cf:	ins    BYTE PTR es:[edi],dx
 2d0:	popa   
 2d1:	outs   dx,BYTE PTR ds:[esi]
 2d2:	addr16 das 
 2d4:	push   ebx
 2d5:	je     0x349
 2d7:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 2de:	jbe    0x341
 2e0:	das    
 2e1:	ins    BYTE PTR es:[edi],dx
 2e2:	popa   
 2e3:	outs   dx,BYTE PTR ds:[esi]
 2e4:	addr16 das 
 2e6:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2ed:	dec    ebp
 2ee:	gs je  0x359
 2f1:	outs   dx,DWORD PTR ds:[esi]
 2f2:	fs push esp
 2f4:	jns    0x366
 2f6:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 2fb:	jbe    0x35e
 2fd:	das    
 2fe:	ins    BYTE PTR es:[edi],dx
 2ff:	popa   
 300:	outs   dx,BYTE PTR ds:[esi]
 301:	addr16 das 
 303:	push   ebx
 304:	je     0x378
 306:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 30d:	popa   
 30e:	jbe    0x371
 310:	das    
 311:	ins    BYTE PTR es:[edi],dx
 312:	popa   
 313:	outs   dx,BYTE PTR ds:[esi]
 314:	addr16 das 
 316:	dec    edi
 317:	bound  ebp,QWORD PTR [edx+0x65]
 31a:	arpl   WORD PTR [ebx+edi*1+0x29],si
 31e:	dec    esp
 31f:	push   0x61
 321:	jbe    0x384
 323:	das    
 324:	ins    BYTE PTR es:[edi],dx
 325:	popa   
 326:	outs   dx,BYTE PTR ds:[esi]
 327:	addr16 das 
 329:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 330:	inc    ebx
 331:	popa   
 332:	ins    BYTE PTR es:[edi],dx
 333:	ins    BYTE PTR es:[edi],dx
 334:	push   ebx
 335:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x14a0007
 33d:	add    BYTE PTR ds:0x6176616a,ah
 343:	das    
 344:	ins    BYTE PTR es:[edi],dx
 345:	popa   
 346:	outs   dx,BYTE PTR ds:[esi]
 347:	addr16 das 
 349:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 350:	dec    ebp
 351:	gs je  0x3bc
 354:	outs   dx,DWORD PTR ds:[esi]
 355:	fs dec eax
 357:	popa   
 358:	outs   dx,BYTE PTR ds:[esi]
 359:	fs ins BYTE PTR es:[edi],dx
 35b:	gs jae 0x382
 35e:	dec    esp
 35f:	outs   dx,DWORD PTR ds:[esi]
 360:	outs   dx,DWORD PTR ds:[esi]
 361:	imul   esi,DWORD PTR [ebp+0x70],0x1
 365:	add    BYTE PTR [esi],bl
 367:	push   0x61
 369:	jbe    0x3cc
 36b:	das    
 36c:	ins    BYTE PTR es:[edi],dx
 36d:	popa   
 36e:	outs   dx,BYTE PTR ds:[esi]
 36f:	addr16 das 
 371:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 378:	dec    ebp
 379:	gs je  0x3e4
 37c:	outs   dx,DWORD PTR ds:[esi]
 37d:	fs dec eax
 37f:	popa   
 380:	outs   dx,BYTE PTR ds:[esi]
 381:	fs ins BYTE PTR es:[edi],dx
 383:	gs jae 0x386
 386:	and    BYTE PTR [eax],al
 388:	or     al,0x0
 38a:	sldt   WORD PTR [eax]
 38d:	add    BYTE PTR [ecx],al
 38f:	add    BYTE PTR [eax],dl
 391:	add    BYTE PTR [eax],dl
 393:	add    BYTE PTR [ecx],dl
 395:	add    BYTE PTR [ecx],al
 397:	add    BYTE PTR [edx],dl
 399:	add    BYTE PTR [eax],al
 39b:	add    BYTE PTR [edx],al
 39d:	add    BYTE PTR [edx],al
 39f:	add    BYTE PTR ds:0x13000000,al
 3a5:	add    BYTE PTR [eax+eax*1],dl
 3a8:	add    DWORD PTR [eax],eax
 3aa:	adc    eax,0x27000000
 3af:	add    BYTE PTR [edx],al
 3b1:	add    BYTE PTR [ecx],al
 3b3:	add    BYTE PTR [eax],al
 3b5:	add    BYTE PTR [ebx],cl
 3b7:	sub    dh,BYTE PTR [edi+0x122a0100]
 3bd:	add    dh,BYTE PTR [ebp+0xb10300]
 3c3:	add    BYTE PTR [eax],al
 3c5:	add    DWORD PTR [eax],eax
 3c7:	push   ss
 3c8:	add    BYTE PTR [eax],al
 3ca:	add    BYTE PTR [edx],cl
 3cc:	add    BYTE PTR [edx],al
 3ce:	add    BYTE PTR [eax],al
 3d0:	add    BYTE PTR [eax+eax*1],al
 3d3:	add    al,0x0
 3d5:	add    eax,0x17000000
 3da:	add    BYTE PTR [eax],bl
 3dc:	add    BYTE PTR [ecx],al
 3de:	add    BYTE PTR ds:0x83010000,dl
 3e4:	add    BYTE PTR ds:0xc00,al
 3ea:	add    cl,cl
 3ec:	sbb    eax,0x6004641c
 3f1:	ss add eax,0x641d0415
 3f7:	ss push es
 3f9:	adc    eax,0x3a0abc05
 3fe:	pop    es
 3ff:	adc    eax,0x3a0abc06
 404:	or     BYTE PTR [ebx],al
 406:	or     DWORD PTR ss:0xa2051509,edx
 40d:	add    BYTE PTR [ecx+ebx*1],dl
 410:	pop    es
 411:	adc    eax,0x151c2b09
 416:	or     DWORD PTR [eax+0x2e],esp
 419:	dec    edi
 41a:	test   BYTE PTR [ecx],cl
 41c:	add    DWORD PTR [edi+0x3603ebff],esp
 422:	or     DWORD PTR ds:0xa2061509,edx
 428:	add    BYTE PTR [esi],dl
 42a:	sbb    DWORD PTR [eax],ecx
 42c:	adc    eax,0x41d2b09
 431:	pusha  
 432:	adc    eax,0x4f2e6009
 437:	test   BYTE PTR [ecx],cl
 439:	add    DWORD PTR [edi+0x3603e9ff],esp
 43f:	or     DWORD PTR [ebx],eax
 441:	or     bl,BYTE PTR ss:[esi+esi*1]
 445:	or     edx,DWORD PTR ds:0xa2051509
 44b:	add    BYTE PTR [eax],bh
 44d:	adc    eax,0xa206150a
 452:	add    BYTE PTR [ecx],dh
 454:	sbb    DWORD PTR [edi],eax
 456:	adc    eax,0x8192e09
 45b:	adc    eax,0xa32e0a
 460:	adc    ch,BYTE PTR [ebx]
 462:	adc    eax,0x1507190b
 467:	or     DWORD PTR [esi],ebp
 469:	dec    edi
 46a:	test   BYTE PTR [ecx],cl
 46c:	add    DWORD PTR [edi+0x152b0f00],esp
 472:	or     ebx,DWORD PTR [ecx]
 474:	or     BYTE PTR ds:0x844f2e0a,dl
 47a:	or     al,BYTE PTR [ecx]
 47c:	test   BYTE PTR [ebx],cl
 47e:	add    DWORD PTR [edi+0x915c7ff],esp
 484:	adc    eax,0x1500a205
 489:	sub    edx,DWORD PTR ds:0x1507190b
 48f:	or     DWORD PTR [esi],ebp
 491:	dec    edi
 492:	test   BYTE PTR [ecx],cl
 494:	add    DWORD PTR [ebx+ecx*1-0x150058ff],eax
 49b:	adc    eax,0xa206150a
 4a0:	add    BYTE PTR ds:0x190b152b,dl
 4a6:	or     BYTE PTR ds:0x844f2e0a,dl
 4ac:	or     al,BYTE PTR [ecx]
 4ae:	test   BYTE PTR [ebx],cl
 4b0:	add    DWORD PTR [edi+0xb1eaff],esp
 4b6:	add    BYTE PTR [eax],al
 4b8:	add    al,BYTE PTR [eax]
 4ba:	push   ss
 4bb:	add    BYTE PTR [eax],al
 4bd:	add    BYTE PTR [edx+0x0],dh
 4c0:	sbb    al,0x0
 4c2:	add    BYTE PTR [eax],al
 4c4:	or     BYTE PTR [eax],al
 4c6:	pop    es
 4c7:	add    BYTE PTR [ecx],cl
 4c9:	add    BYTE PTR ds:0x13000b00,cl
 4cf:	add    BYTE PTR [eax+eax*1],cl
 4d2:	sbb    DWORD PTR [eax],eax
 4d4:	verr   WORD PTR [ebx]
 4d7:	add    BYTE PTR [eax],dl
 4d9:	add    BYTE PTR [esi],ch
 4db:	add    BYTE PTR [edi],cl
 4dd:	add    BYTE PTR [eax+eax*1],dh
 4e0:	adc    DWORD PTR [eax],eax
 4e2:	add    BYTE PTR ds:[edx],dl
 4e5:	add    BYTE PTR [ebx+0x0],cl
 4e8:	adc    DWORD PTR [eax],eax
 4ea:	push   ecx
 4eb:	add    BYTE PTR [edi],dl
 4ed:	add    BYTE PTR [edi+0x0],dl
 4f0:	sbb    al,BYTE PTR [eax]
 4f2:	pop    edx
 4f3:	add    BYTE PTR [ebx],bl
 4f5:	add    BYTE PTR [eax+0x0],ch
 4f8:	sbb    al,0x0
 4fa:	jne    0x4fc
 4fc:	sbb    eax,0x1e007e00
 501:	add    BYTE PTR [eax+eax*1+0x8d0021],al
 508:	and    al,BYTE PTR [eax]
 50a:	nop
 50b:	add    BYTE PTR [eax+eax*1],ah
 50e:	xchg   esi,eax
 50f:	add    BYTE PTR [eax],ch
 511:	add    BYTE PTR [ebp-0x59ffd700],bl
 517:	add    BYTE PTR [edx],ch
 519:	add    BYTE PTR [ecx-0x50ffd500],ch
 51f:	add    BYTE PTR [edi],ch
 521:	add    BYTE PTR [esi-0x40ffd000],dh
 527:	add    BYTE PTR [ecx],dh
 529:	add    dl,al
 52b:	add    BYTE PTR [edx],dh
 52d:	add    al,cl
 52f:	add    BYTE PTR [eax+eax*1],dh
 532:	sbb    DWORD PTR [eax],eax
 534:	add    BYTE PTR [eax],al
 536:	xor    BYTE PTR [eax],al
 538:	or     bh,bh
 53a:	add    BYTE PTR [eax+eax*1],bl
 53d:	or     al,BYTE PTR [edi]
 53f:	add    BYTE PTR [edi+eax*1],cl
 542:	add    BYTE PTR [edx],bl
 544:	add    DWORD PTR [ecx],eax
 546:	add    DWORD PTR [ecx],eax
 548:	add    DWORD PTR [edi],eax
 54a:	add    BYTE PTR [edx],bl
 54c:	pop    es
 54d:	add    BYTE PTR [edx],bl
 54f:	add    DWORD PTR [eax],eax
 551:	add    dl,bh
 553:	add    BYTE PTR [edi],dl
 555:	cld    
 556:	add    BYTE PTR [edx],al
 558:	add    edx,edi
 55a:	add    BYTE PTR [ecx],bl
 55c:	inc    BYTE PTR [eax]
 55e:	or     BYTE PTR [ecx],al
 560:	add    DWORD PTR [ecx],eax
 562:	sub    DWORD PTR [ebx],ecx
 564:	add    eax,0x1818
 569:	add    BYTE PTR [ebx],bl
 56b:	add    BYTE PTR [eax+eax*1],bl
 56e:	add    DWORD PTR [eax],eax
 570:	adc    eax,0x5f000000
 575:	add    BYTE PTR ds:0x500,al
 57b:	add    BYTE PTR [edx],ch
 57d:	sbb    al,0x1d
 57f:	mov    ds:0x1d1c2700,al
 584:	sbb    al,0x64
 586:	add    eax,0x436606c
 58b:	sub    ch,BYTE PTR [ebx]
 58d:	sbb    al,0x15
 58f:	add    al,0xb6
 591:	add    BYTE PTR [edx+ebp*1],al
 594:	sub    edx,DWORD PTR ds:0x1d600404
 59a:	mov    dh,0x0
 59c:	add    al,0x2a
 59e:	sub    ebx,DWORD PTR [edx*1+0xb61d04]
 5a5:	add    eax,0xb1
 5aa:	add    al,BYTE PTR [eax]
 5ac:	push   ss
 5ad:	add    BYTE PTR [eax],al
 5af:	add    BYTE PTR [edx],bl
 5b1:	add    BYTE PTR [esi],al
 5b3:	add    BYTE PTR [eax],al
 5b5:	add    BYTE PTR [edx],bh
 5b7:	add    BYTE PTR ds:0xe003c00,al
 5bd:	add    BYTE PTR [edi],bh
 5bf:	add    BYTE PTR [esi],dl
 5c1:	add    BYTE PTR [eax+0x0],al
 5c4:	and    BYTE PTR [eax],al
 5c6:	inc    edx
 5c7:	add    BYTE PTR [ecx],ch
 5c9:	add    BYTE PTR [eax+eax*1+0x19],al
 5cd:	add    BYTE PTR [eax],al
 5cf:	add    BYTE PTR [ebx],al
 5d1:	add    BYTE PTR [ecx],al
 5d3:	sub    DWORD PTR [eax],eax
 5d5:	or     BYTE PTR [eax],al
 5d7:	sbb    eax,0x1001e00
 5dc:	add    BYTE PTR ds:0x63000000,dl
 5e2:	add    BYTE PTR [ebx],al
 5e4:	add    BYTE PTR [ebx],al
 5e6:	add    BYTE PTR [eax],al
 5e8:	add    BYTE PTR [edi],ah
 5ea:	adc    BYTE PTR [esi],al
 5ec:	cmp    al,0x3
 5ee:	cmp    eax,0xa21b1c
 5f3:	pop    ss
 5f4:	mov    dl,0x0
 5f6:	push   es
 5f7:	sub    bl,BYTE PTR [esi+ebp*1]
 5fa:	mov    edx,0x700
 5ff:	mov    dh,0x0
 601:	or     BYTE PTR [edx+eax*1-0x150058ff],al
 608:	mov    dl,0x0
 60a:	push   es
 60b:	adc    BYTE PTR [esi],al
 60d:	mov    dh,0x0
 60f:	or     DWORD PTR [ecx+0x2000000],esi
 615:	add    BYTE PTR [esi],dl
 617:	add    BYTE PTR [eax],al
 619:	add    BYTE PTR [edx],bl
 61b:	add    BYTE PTR [esi],al
 61d:	add    BYTE PTR [eax],al
 61f:	add    BYTE PTR [ecx+0x0],cl
 622:	add    eax,DWORD PTR [eax]
 624:	dec    edx
 625:	add    BYTE PTR [edx],cl
 627:	add    BYTE PTR [ebx+0x0],cl
 62a:	sbb    BYTE PTR [eax],al
 62c:	dec    edx
 62d:	add    BYTE PTR [esi],bl
 62f:	add    BYTE PTR [eax+eax*1+0x26],cl
 633:	add    BYTE PTR [ebp+0x0],cl
 636:	sbb    DWORD PTR [eax],eax
 638:	add    BYTE PTR [eax],al
 63a:	or     al,BYTE PTR [eax]
 63c:	add    bh,ch
 63e:	add    BYTE PTR ds:0xfa0101,al
 644:	sbb    BYTE PTR [eax],al
 646:	or     DWORD PTR [eax],eax
 648:	pop    ds
 649:	add    BYTE PTR [eax],ah
 64b:	add    BYTE PTR [ecx],al
 64d:	add    BYTE PTR ds:0x96000000,dl
 653:	add    BYTE PTR [eax+eax*1],al
 656:	add    eax,DWORD PTR [eax]
 658:	add    BYTE PTR [eax],al
 65a:	dec    edx
 65b:	adc    BYTE PTR [esi],al
 65d:	mov    esp,0x32b4c0a
 662:	adc    BYTE PTR [edi+ecx*2],cl
 665:	sub    eax,DWORD PTR [eax+edx*1]
 668:	or     ecx,DWORD PTR [edi+0x2b]
 66b:	add    eax,0x2b4f0d10
 670:	push   es
 671:	or     BYTE PTR [edi+0x2b],cl
 674:	pop    es
 675:	adc    BYTE PTR [esi],al
 677:	dec    edi
 678:	sub    ecx,DWORD PTR [eax]
 67a:	adc    BYTE PTR [edi],al
 67c:	dec    edi
 67d:	mov    dl,0x0
 67f:	push   es
 680:	adc    cl,BYTE PTR [edx]
 682:	mov    dh,0x0
 684:	or     BYTE PTR [ebx],ch
 686:	mov    eax,0xbb0b00
 68b:	or     al,0x59
 68d:	mov    bh,0x0
 68f:	or     eax,0x32b2c4d
 694:	or     BYTE PTR [esi+0xb20400],dh
 69a:	push   es
 69b:	adc    cl,BYTE PTR [esi]
 69d:	mov    dh,0x0
 69f:	or     BYTE PTR [ebx],ch
 6a1:	mov    eax,0xb10b00
 6a6:	add    BYTE PTR [eax],al
 6a8:	add    DWORD PTR [eax],eax
 6aa:	push   ss
 6ab:	add    BYTE PTR [eax],al
 6ad:	add    BYTE PTR [edx],bh
 6af:	add    BYTE PTR [esi],cl
 6b1:	add    BYTE PTR [eax],al
 6b3:	add    BYTE PTR [edx+0x0],dl
 6b6:	add    eax,0xa005300
 6bb:	add    BYTE PTR [eax+eax*1+0xf],dl
 6bf:	add    BYTE PTR [ebp+0x0],dl
 6c2:	adc    al,0x0
 6c4:	push   esi
 6c5:	add    BYTE PTR [eax],bl
 6c7:	add    BYTE PTR [edi+0x0],dl
 6ca:	sbb    eax,0x22005800
 6cf:	add    BYTE PTR [edx+0x0],bl
 6d2:	sub    al,BYTE PTR [eax]
 6d4:	pop    ebx
 6d5:	add    BYTE PTR [esi],ch
 6d7:	add    BYTE PTR [ebp+0x0],bl
 6da:	add    BYTE PTR ss:[esi+0x0],bl
 6de:	cmp    eax,0x45005f00
 6e3:	add    BYTE PTR [eax+0x0],ah
 6e6:	dec    ecx
 6e7:	add    BYTE PTR [ecx+0x0],ah
 6ea:	add    eax,DWORD PTR [eax]
 6ec:	and    DWORD PTR [eax],eax
 6ee:	add    BYTE PTR [eax],al
 6f0:	add    al,BYTE PTR [eax]
 6f2:	and    al,BYTE PTR [eax]
 6f4:	inc    esi
 6f5:	add    BYTE PTR [eax],al
 6f7:	add    BYTE PTR [edx],cl
 6f9:	add    BYTE PTR [ecx],al
 6fb:	add    BYTE PTR [eax+eax*1+0x48],al
 6ff:	add    BYTE PTR [ebp+0x0],al
 702:	sbb    DWORD PTR [eax],eax
 704:	sub    DWORD PTR [eax],eax
 706:	add    BYTE PTR [eax],al
 708:	or     BYTE PTR [eax],al
 70a:	add    DWORD PTR [eax],eax
 70c:	sub    al,BYTE PTR [eax]
 70e:	add    DWORD PTR [eax],eax
 710:	.byte 0x2b

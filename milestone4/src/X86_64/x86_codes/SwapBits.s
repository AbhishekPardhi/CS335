
SwapBits.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edx],dh
   a:	or     al,BYTE PTR [eax]
   c:	pop    es
   d:	add    BYTE PTR [edx],dl
   f:	or     al,BYTE PTR [eax]
  11:	push   es
  12:	add    BYTE PTR [ebx],dl
  14:	or     DWORD PTR [eax],eax
  16:	adc    al,0x0
  18:	adc    eax,0x12
  1d:	sbb    DWORD PTR [edx],ecx
  1f:	add    BYTE PTR [edx],bl
  21:	add    BYTE PTR [ebx],bl
  23:	pop    es
  24:	add    BYTE PTR [edi+eax*1],bl
  27:	add    BYTE PTR ds:0x3c060001,bl
  2d:	imul   ebp,DWORD PTR [esi+0x69],0x13e74
  34:	add    ebp,DWORD PTR [eax]
  36:	sub    DWORD PTR [esi+0x1],edx
  39:	add    BYTE PTR [ebx+eax*2],al
  3c:	outs   dx,DWORD PTR ds:[esi]
  3d:	fs add DWORD PTR gs:[eax],eax
  41:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  45:	gs dec esi
  47:	jne    0xb6
  49:	bound  esp,QWORD PTR [ebp+0x72]
  4c:	push   esp
  4d:	popa   
  4e:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  52:	add    BYTE PTR [eax],cl
  54:	jae    0xcd
  56:	popa   
  57:	jo     0x9b
  59:	imul   esi,DWORD PTR [ebx+esi*2+0x1],0x49280700
  61:	dec    ecx
  62:	dec    ecx
  63:	dec    ecx
  64:	sub    DWORD PTR [ecx+0x1],ecx
  67:	add    BYTE PTR [ebp*2+0x16e6961],al
  6e:	add    BYTE PTR [esi],dl
  70:	sub    BYTE PTR [ebx+0x4c],bl
  73:	push   0x61
  75:	jbe    0xd8
  77:	das    
  78:	ins    BYTE PTR es:[edi],dx
  79:	popa   
  7a:	outs   dx,BYTE PTR ds:[esi]
  7b:	addr16 das 
  7d:	push   ebx
  7e:	je     0xf2
  80:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  87:	add    BYTE PTR [edx],cl
  89:	push   ebx
  8a:	outs   dx,DWORD PTR ds:[esi]
  8b:	jne    0xff
  8d:	arpl   WORD PTR [ebp+0x46],sp
  90:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x77530d00
  98:	popa   
  99:	jo     0xdd
  9b:	imul   esi,DWORD PTR [ebx+esi*2+0x2e],0x6176616a
  a3:	or     al,0x0
  a5:	or     BYTE PTR [eax],al
  a7:	or     DWORD PTR [eax+eax*1],ecx
  aa:	or     al,0x0
  ac:	or     eax,0xc1e0007
  b1:	add    BYTE PTR [edi],bl
  b3:	add    BYTE PTR [eax],ah
  b5:	add    DWORD PTR [eax],eax
  b7:	adc    BYTE PTR [edx+0x6f],al
  ba:	outs   dx,DWORD PTR ds:[esi]
  bb:	je     0x130
  bd:	je     0x131
  bf:	popa   
  c0:	jo     0x10f
  c2:	gs je  0x12d
  c5:	outs   dx,DWORD PTR ds:[esi]
  c6:	fs jae 0xd8
  c9:	push   es
  ca:	add    BYTE PTR [ecx],ah
  cc:	or     BYTE PTR [eax],al
  ce:	and    cl,BYTE PTR [eax+eax*1]
  d1:	and    eax,DWORD PTR [eax]
  d3:	and    al,0x7
  d5:	add    BYTE PTR ds:0x26000c,ah
  db:	daa    
  dc:	add    DWORD PTR [eax],eax
  de:	or     BYTE PTR [ebx+0x77],dl
  e1:	popa   
  e2:	jo     0x126
  e4:	imul   esi,DWORD PTR [ebx+esi*2+0x1],0x616a1000
  ec:	jbe    0x14f
  ee:	das    
  ef:	ins    BYTE PTR es:[edi],dx
  f0:	popa   
  f1:	outs   dx,BYTE PTR ds:[esi]
  f2:	addr16 das 
  f4:	dec    edi
  f5:	bound  ebp,QWORD PTR [edx+0x65]
  f8:	arpl   WORD PTR [ecx+eax*1+0x0],si
  fc:	adc    BYTE PTR [edx+0x61],ch
  ff:	jbe    0x162
 101:	das    
 102:	ins    BYTE PTR es:[edi],dx
 103:	popa   
 104:	outs   dx,BYTE PTR ds:[esi]
 105:	addr16 das 
 107:	push   ebx
 108:	jns    0x17d
 10a:	je     0x171
 10c:	ins    DWORD PTR es:[edi],dx
 10d:	add    DWORD PTR [eax],eax
 10f:	add    ebp,DWORD PTR [edi+0x75]
 112:	je     0x115
 114:	add    BYTE PTR ds:0x76616a4c,dl
 11a:	popa   
 11b:	das    
 11c:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 123:	je     0x178
 125:	je     0x199
 127:	gs popa 
 129:	ins    DWORD PTR es:[edi],dx
 12a:	cmp    ecx,DWORD PTR [edx]
 12c:	add    BYTE PTR [eax],ch
 12e:	add    BYTE PTR [ecx],ch
 130:	add    DWORD PTR [eax],eax
 132:	or     dl,BYTE PTR [edx+0x65]
 135:	jae    0x1ac
 137:	ins    BYTE PTR es:[edi],dx
 138:	je     0x15a
 13a:	cmp    eax,0x10120
 13f:	pop    ss
 140:	ins    DWORD PTR es:[edi],dx
 141:	popa   
 142:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 146:	outs   dx,BYTE PTR ds:[esi]
 147:	arpl   WORD PTR [ecx+0x74],sp
 14a:	push   edi
 14b:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 153:	popa   
 154:	outs   dx,BYTE PTR ds:[esi]
 155:	je     0x1ca
 157:	add    DWORD PTR [eax],eax
 159:	adc    eax,0x4c294928
 15e:	push   0x61
 160:	jbe    0x1c3
 162:	das    
 163:	ins    BYTE PTR es:[edi],dx
 164:	popa   
 165:	outs   dx,BYTE PTR ds:[esi]
 166:	addr16 das 
 168:	push   ebx
 169:	je     0x1dd
 16b:	imul   ebp,DWORD PTR [esi+0x67],0x1300013b
 172:	push   0x61
 174:	jbe    0x1d7
 176:	das    
 177:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 17e:	je     0x1d3
 180:	je     0x1f4
 182:	gs popa 
 184:	ins    DWORD PTR es:[edi],dx
 185:	add    DWORD PTR [eax],eax
 187:	pop    es
 188:	jo     0x1fc
 18a:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 191:	adc    eax,0x616a4c28
 196:	jbe    0x1f9
 198:	das    
 199:	ins    BYTE PTR es:[edi],dx
 19a:	popa   
 19b:	outs   dx,BYTE PTR ds:[esi]
 19c:	addr16 das 
 19e:	push   ebx
 19f:	je     0x213
 1a1:	imul   ebp,DWORD PTR [esi+0x67],0x756293b
 1a8:	add    BYTE PTR [edx],ch
 1aa:	or     al,0x0
 1ac:	and    eax,DWORD PTR [eax]
 1ae:	add    DWORD PTR cs:[eax],eax
 1b1:	and    al,0x6a
 1b3:	popa   
 1b4:	jbe    0x217
 1b6:	das    
 1b7:	ins    BYTE PTR es:[edi],dx
 1b8:	popa   
 1b9:	outs   dx,BYTE PTR ds:[esi]
 1ba:	addr16 das 
 1bc:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 1c3:	push   ebx
 1c4:	je     0x238
 1c6:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 1cd:	popa   
 1ce:	je     0x216
 1d0:	popa   
 1d1:	arpl   WORD PTR [edi+ebp*2+0x72],si
 1d5:	jns    0x1de
 1d7:	add    BYTE PTR [eax],dh
 1d9:	add    DWORD PTR [eax],eax
 1db:	push   es
 1dc:	dec    esp
 1dd:	outs   dx,DWORD PTR ds:[esi]
 1de:	outs   dx,DWORD PTR ds:[esi]
 1df:	imul   esi,DWORD PTR [ebp+0x70],0x1
 1e3:	add    BYTE PTR [ecx+ecx*2],cl
 1e6:	outs   dx,BYTE PTR ds:[esi]
 1e7:	outs   dx,BYTE PTR ds:[esi]
 1e8:	gs jb  0x22e
 1eb:	ins    BYTE PTR es:[edi],dx
 1ec:	popa   
 1ed:	jae    0x262
 1ef:	gs jae 0x1f3
 1f2:	add    BYTE PTR [eax+0x616a4c28],bl
 1f8:	jbe    0x25b
 1fa:	das    
 1fb:	ins    BYTE PTR es:[edi],dx
 1fc:	popa   
 1fd:	outs   dx,BYTE PTR ds:[esi]
 1fe:	addr16 das 
 200:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 207:	dec    ebp
 208:	gs je  0x273
 20b:	outs   dx,DWORD PTR ds:[esi]
 20c:	fs dec eax
 20e:	popa   
 20f:	outs   dx,BYTE PTR ds:[esi]
 210:	fs ins BYTE PTR es:[edi],dx
 212:	gs jae 0x239
 215:	dec    esp
 216:	outs   dx,DWORD PTR ds:[esi]
 217:	outs   dx,DWORD PTR ds:[esi]
 218:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 21c:	dec    esp
 21d:	push   0x61
 21f:	jbe    0x282
 221:	das    
 222:	ins    BYTE PTR es:[edi],dx
 223:	popa   
 224:	outs   dx,BYTE PTR ds:[esi]
 225:	addr16 das 
 227:	push   ebx
 228:	je     0x29c
 22a:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 231:	jbe    0x294
 233:	das    
 234:	ins    BYTE PTR es:[edi],dx
 235:	popa   
 236:	outs   dx,BYTE PTR ds:[esi]
 237:	addr16 das 
 239:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 240:	dec    ebp
 241:	gs je  0x2ac
 244:	outs   dx,DWORD PTR ds:[esi]
 245:	fs push esp
 247:	jns    0x2b9
 249:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 24e:	jbe    0x2b1
 250:	das    
 251:	ins    BYTE PTR es:[edi],dx
 252:	popa   
 253:	outs   dx,BYTE PTR ds:[esi]
 254:	addr16 das 
 256:	push   ebx
 257:	je     0x2cb
 259:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 260:	popa   
 261:	jbe    0x2c4
 263:	das    
 264:	ins    BYTE PTR es:[edi],dx
 265:	popa   
 266:	outs   dx,BYTE PTR ds:[esi]
 267:	addr16 das 
 269:	dec    edi
 26a:	bound  ebp,QWORD PTR [edx+0x65]
 26d:	arpl   WORD PTR [ebx+edi*1+0x29],si
 271:	dec    esp
 272:	push   0x61
 274:	jbe    0x2d7
 276:	das    
 277:	ins    BYTE PTR es:[edi],dx
 278:	popa   
 279:	outs   dx,BYTE PTR ds:[esi]
 27a:	addr16 das 
 27c:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 283:	inc    ebx
 284:	popa   
 285:	ins    BYTE PTR es:[edi],dx
 286:	ins    BYTE PTR es:[edi],dx
 287:	push   ebx
 288:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x1310007
 290:	add    BYTE PTR ds:0x6176616a,ah
 296:	das    
 297:	ins    BYTE PTR es:[edi],dx
 298:	popa   
 299:	outs   dx,BYTE PTR ds:[esi]
 29a:	addr16 das 
 29c:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2a3:	dec    ebp
 2a4:	gs je  0x30f
 2a7:	outs   dx,DWORD PTR ds:[esi]
 2a8:	fs dec eax
 2aa:	popa   
 2ab:	outs   dx,BYTE PTR ds:[esi]
 2ac:	fs ins BYTE PTR es:[edi],dx
 2ae:	gs jae 0x2d5
 2b1:	dec    esp
 2b2:	outs   dx,DWORD PTR ds:[esi]
 2b3:	outs   dx,DWORD PTR ds:[esi]
 2b4:	imul   esi,DWORD PTR [ebp+0x70],0x1
 2b8:	add    BYTE PTR [esi],bl
 2ba:	push   0x61
 2bc:	jbe    0x31f
 2be:	das    
 2bf:	ins    BYTE PTR es:[edi],dx
 2c0:	popa   
 2c1:	outs   dx,BYTE PTR ds:[esi]
 2c2:	addr16 das 
 2c4:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2cb:	dec    ebp
 2cc:	gs je  0x337
 2cf:	outs   dx,DWORD PTR ds:[esi]
 2d0:	fs dec eax
 2d2:	popa   
 2d3:	outs   dx,BYTE PTR ds:[esi]
 2d4:	fs ins BYTE PTR es:[edi],dx
 2d6:	gs jae 0x2d9
 2d9:	and    BYTE PTR [eax],al
 2db:	push   es
 2dc:	add    BYTE PTR [edi],al
 2de:	add    BYTE PTR [eax],al
 2e0:	add    BYTE PTR [eax],al
 2e2:	add    BYTE PTR [ebx],al
 2e4:	add    BYTE PTR [eax],al
 2e6:	add    BYTE PTR [eax],cl
 2e8:	add    BYTE PTR [ecx],cl
 2ea:	add    BYTE PTR [ecx],al
 2ec:	add    BYTE PTR [edx],cl
 2ee:	add    BYTE PTR [eax],al
 2f0:	add    BYTE PTR ds:0x1000100,bl
 2f6:	add    BYTE PTR [eax],al
 2f8:	add    BYTE PTR ds:0x100b72a,al
 2fe:	mov    cl,0x0
 300:	add    BYTE PTR [eax],al
 302:	add    DWORD PTR [eax],eax
 304:	or     eax,DWORD PTR [eax]
 306:	add    BYTE PTR [eax],al
 308:	push   es
 309:	add    BYTE PTR [ecx],al
 30b:	add    BYTE PTR [eax],al
 30d:	add    BYTE PTR ds:0xc000800,al
 313:	add    BYTE PTR ds:0xa000100,cl
 319:	add    BYTE PTR [eax],al
 31b:	add    BYTE PTR [ebp+0x0],bl
 31e:	add    eax,DWORD PTR [eax]
 320:	or     BYTE PTR [eax],al
 322:	add    BYTE PTR [eax],al
 324:	xor    DWORD PTR [edx],ebx
 326:	sbb    edi,DWORD PTR [edx+0x4]
 329:	sbb    eax,0x7e640478
 32e:	ss add al,0x1a
 331:	sbb    al,0x7a
 333:	add    al,0x1d
 335:	js     0x33b
 337:	fs jle 0x370
 33a:	add    eax,0x5150415
 33f:	xor    BYTE PTR [esi],0x6
 342:	adc    eax,0x15781b06
 347:	push   es
 348:	sbb    al,0x78
 34a:	xor    BYTE PTR [esi],0x6
 34d:	sbb    dl,BYTE PTR ds:0x7368206
 353:	adc    eax,0xac07
 358:	add    BYTE PTR [ecx],al
 35a:	add    BYTE PTR [ebx],cl
 35c:	add    BYTE PTR [eax],al
 35e:	add    BYTE PTR [edx],bl
 360:	add    BYTE PTR [esi],al
 362:	add    BYTE PTR [eax],al
 364:	add    BYTE PTR [ebx],cl
 366:	add    BYTE PTR [ebx],cl
 368:	add    BYTE PTR [edi],cl
 36a:	add    BYTE PTR [esi],dl
 36c:	add    BYTE PTR [edx],dl
 36e:	add    BYTE PTR ds:0x28001600,bl
 374:	add    BYTE PTR [edx],bl
 376:	add    BYTE PTR [esi],ch
 378:	add    BYTE PTR [eax+eax*1],bl
 37b:	or     DWORD PTR [eax],eax
 37d:	push   cs
 37e:	add    BYTE PTR [edi],cl
 380:	add    BYTE PTR [ecx],al
 382:	add    BYTE PTR [edx],cl
 384:	add    BYTE PTR [eax],al
 386:	add    BYTE PTR [esi],dh
 388:	add    BYTE PTR [eax+eax*1],al
 38b:	add    al,BYTE PTR [eax]
 38d:	add    BYTE PTR [eax],al
 38f:	push   ss
 390:	adc    BYTE PTR [ebx+eax*1],bl
 393:	push   es
 394:	add    eax,0x3c0200b8
 399:	mov    dl,0x0
 39b:	add    ebx,DWORD PTR [ebx]
 39d:	mov    edx,0x400
 3a2:	mov    dh,0x0
 3a4:	add    eax,0xb1
 3a9:	add    DWORD PTR [eax],eax
 3ab:	or     eax,DWORD PTR [eax]
 3ad:	add    BYTE PTR [eax],al
 3af:	push   cs
 3b0:	add    BYTE PTR [ebx],al
 3b2:	add    BYTE PTR [eax],al
 3b4:	add    BYTE PTR [edx],ah
 3b6:	add    BYTE PTR [ecx],cl
 3b8:	add    BYTE PTR [ebx],ah
 3ba:	add    BYTE PTR ds:0x3002400,dl
 3c0:	add    BYTE PTR [eax],dl
 3c2:	add    BYTE PTR [eax],al
 3c4:	add    BYTE PTR [edx],al
 3c6:	add    BYTE PTR [ecx],dl
 3c8:	add    BYTE PTR ds:0xa000000,ch
 3ce:	add    BYTE PTR [ecx],al
 3d0:	add    BYTE PTR [ebx],ch
 3d2:	add    BYTE PTR [edi],ch
 3d4:	add    BYTE PTR [eax+eax*1],ch
 3d7:	sbb    DWORD PTR [eax],eax
 3d9:	push   ss
 3da:	add    BYTE PTR [eax],al
 3dc:	add    BYTE PTR [eax],cl
 3de:	add    BYTE PTR [ecx],al
 3e0:	add    BYTE PTR [edi],dl
 3e2:	add    BYTE PTR [ecx],al
 3e4:	add    BYTE PTR [eax],bl


TypeConv.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edx+ecx*1],dh
   b:	add    BYTE PTR [eax+eax*1],cl
   e:	adc    eax,0xc3000003
  13:	push   eax
  14:	add    al,0x40
  16:	mov    ch,0x70
  18:	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
  19:	push   es
  1a:	aas    
  1b:	mov    edi,0x53742497
  20:	mov    ?,ebx
  22:	push   es
  23:	inc    eax
  24:	adc    al,0x0
  26:	add    BYTE PTR [eax],al
  28:	add    BYTE PTR [eax],al
  2a:	add    BYTE PTR [ecx],cl
  2c:	add    BYTE PTR [esi],dl
  2e:	add    BYTE PTR [edi],dl
  30:	adc    al,BYTE PTR [eax]
  32:	add    BYTE PTR [eax],al
  34:	sbb    ecx,DWORD PTR [edx]
  36:	add    BYTE PTR [eax+eax*1],bl
  39:	sbb    eax,0x71e0007
  3e:	add    BYTE PTR [edi],bl
  40:	add    DWORD PTR [eax],eax
  42:	push   es
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
  92:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x79540d00
  9a:	jo     0x101
  9c:	inc    ebx
  9d:	outs   dx,DWORD PTR ds:[esi]
  9e:	outs   dx,BYTE PTR ds:[esi]
  9f:	jbe    0xcf
  a1:	push   0x61
  a3:	jbe    0x106
  a5:	or     al,0x0
  a7:	or     eax,0x70e00
  ac:	and    BYTE PTR [eax+eax*1],cl
  af:	and    DWORD PTR [eax],eax
  b1:	and    al,BYTE PTR [ecx]
  b3:	add    BYTE PTR [eax],dl
  b5:	inc    edx
  b6:	outs   dx,DWORD PTR ds:[esi]
  b7:	outs   dx,DWORD PTR ds:[esi]
  b8:	je     0x12d
  ba:	je     0x12e
  bc:	popa   
  bd:	jo     0x10c
  bf:	gs je  0x12a
  c2:	outs   dx,DWORD PTR ds:[esi]
  c3:	fs jae 0xd5
  c6:	push   es
  c7:	add    BYTE PTR [ebx],ah
  c9:	or     BYTE PTR [eax],al
  cb:	and    al,0xc
  cd:	add    BYTE PTR ds:0x72600,ah
  d3:	daa    
  d4:	or     al,0x0
  d6:	sub    BYTE PTR [eax],al
  d8:	sub    DWORD PTR [ecx],eax
  da:	add    BYTE PTR [eax],cl
  dc:	push   esp
  dd:	jns    0x14f
  df:	gs inc ebx
  e1:	outs   dx,DWORD PTR ds:[esi]
  e2:	outs   dx,BYTE PTR ds:[esi]
  e3:	jbe    0xe6
  e5:	add    BYTE PTR [eax],dl
  e7:	push   0x61
  e9:	jbe    0x14c
  eb:	das    
  ec:	ins    BYTE PTR es:[edi],dx
  ed:	popa   
  ee:	outs   dx,BYTE PTR ds:[esi]
  ef:	addr16 das 
  f1:	dec    edi
  f2:	bound  ebp,QWORD PTR [edx+0x65]
  f5:	arpl   WORD PTR [ecx+eax*1+0x0],si
  f9:	adc    BYTE PTR [edx+0x61],ch
  fc:	jbe    0x15f
  fe:	das    
  ff:	ins    BYTE PTR es:[edi],dx
 100:	popa   
 101:	outs   dx,BYTE PTR ds:[esi]
 102:	addr16 das 
 104:	push   ebx
 105:	jns    0x17a
 107:	je     0x16e
 109:	ins    DWORD PTR es:[edi],dx
 10a:	add    DWORD PTR [eax],eax
 10c:	add    ebp,DWORD PTR [edi+0x75]
 10f:	je     0x112
 111:	add    BYTE PTR ds:0x76616a4c,dl
 117:	popa   
 118:	das    
 119:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 120:	je     0x175
 122:	je     0x196
 124:	gs popa 
 126:	ins    DWORD PTR es:[edi],dx
 127:	cmp    ecx,DWORD PTR [edx]
 129:	add    BYTE PTR [edx],ch
 12b:	add    BYTE PTR [ebx],ch
 12d:	add    DWORD PTR [eax],eax
 12f:	or     dh,BYTE PTR [edx+0x65]
 132:	jae    0x1a9
 134:	ins    BYTE PTR es:[edi],dx
 135:	je     0x157
 137:	cmp    eax,0x10120
 13c:	pop    ss
 13d:	ins    DWORD PTR es:[edi],dx
 13e:	popa   
 13f:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 143:	outs   dx,BYTE PTR ds:[esi]
 144:	arpl   WORD PTR [ecx+0x74],sp
 147:	push   edi
 148:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 150:	popa   
 151:	outs   dx,BYTE PTR ds:[esi]
 152:	je     0x1c7
 154:	add    DWORD PTR [eax],eax
 156:	adc    eax,0x4c294428
 15b:	push   0x61
 15d:	jbe    0x1c0
 15f:	das    
 160:	ins    BYTE PTR es:[edi],dx
 161:	popa   
 162:	outs   dx,BYTE PTR ds:[esi]
 163:	addr16 das 
 165:	push   ebx
 166:	je     0x1da
 168:	imul   ebp,DWORD PTR [esi+0x67],0x1300013b
 16f:	push   0x61
 171:	jbe    0x1d4
 173:	das    
 174:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 17b:	je     0x1d0
 17d:	je     0x1f1
 17f:	gs popa 
 181:	ins    DWORD PTR es:[edi],dx
 182:	add    DWORD PTR [eax],eax
 184:	pop    es
 185:	jo     0x1f9
 187:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 18e:	adc    eax,0x616a4c28
 193:	jbe    0x1f6
 195:	das    
 196:	ins    BYTE PTR es:[edi],dx
 197:	popa   
 198:	outs   dx,BYTE PTR ds:[esi]
 199:	addr16 das 
 19b:	push   ebx
 19c:	je     0x210
 19e:	imul   ebp,DWORD PTR [esi+0x67],0x756293b
 1a5:	add    BYTE PTR [esp+ecx*1],ch
 1a8:	add    BYTE PTR ds:0x13000,ah
 1ae:	and    al,0x6a
 1b0:	popa   
 1b1:	jbe    0x214
 1b3:	das    
 1b4:	ins    BYTE PTR es:[edi],dx
 1b5:	popa   
 1b6:	outs   dx,BYTE PTR ds:[esi]
 1b7:	addr16 das 
 1b9:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 1c0:	push   ebx
 1c1:	je     0x235
 1c3:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 1ca:	popa   
 1cb:	je     0x213
 1cd:	popa   
 1ce:	arpl   WORD PTR [edi+ebp*2+0x72],si
 1d2:	jns    0x1db
 1d4:	add    BYTE PTR [edx],dh
 1d6:	add    DWORD PTR [eax],eax
 1d8:	push   es
 1d9:	dec    esp
 1da:	outs   dx,DWORD PTR ds:[esi]
 1db:	outs   dx,DWORD PTR ds:[esi]
 1dc:	imul   esi,DWORD PTR [ebp+0x70],0x1
 1e0:	add    BYTE PTR [ecx+ecx*2],cl
 1e3:	outs   dx,BYTE PTR ds:[esi]
 1e4:	outs   dx,BYTE PTR ds:[esi]
 1e5:	gs jb  0x22b
 1e8:	ins    BYTE PTR es:[edi],dx
 1e9:	popa   
 1ea:	jae    0x25f
 1ec:	gs jae 0x1f0
 1ef:	add    BYTE PTR [eax+0x616a4c28],bl
 1f5:	jbe    0x258
 1f7:	das    
 1f8:	ins    BYTE PTR es:[edi],dx
 1f9:	popa   
 1fa:	outs   dx,BYTE PTR ds:[esi]
 1fb:	addr16 das 
 1fd:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 204:	dec    ebp
 205:	gs je  0x270
 208:	outs   dx,DWORD PTR ds:[esi]
 209:	fs dec eax
 20b:	popa   
 20c:	outs   dx,BYTE PTR ds:[esi]
 20d:	fs ins BYTE PTR es:[edi],dx
 20f:	gs jae 0x236
 212:	dec    esp
 213:	outs   dx,DWORD PTR ds:[esi]
 214:	outs   dx,DWORD PTR ds:[esi]
 215:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 219:	dec    esp
 21a:	push   0x61
 21c:	jbe    0x27f
 21e:	das    
 21f:	ins    BYTE PTR es:[edi],dx
 220:	popa   
 221:	outs   dx,BYTE PTR ds:[esi]
 222:	addr16 das 
 224:	push   ebx
 225:	je     0x299
 227:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 22e:	jbe    0x291
 230:	das    
 231:	ins    BYTE PTR es:[edi],dx
 232:	popa   
 233:	outs   dx,BYTE PTR ds:[esi]
 234:	addr16 das 
 236:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 23d:	dec    ebp
 23e:	gs je  0x2a9
 241:	outs   dx,DWORD PTR ds:[esi]
 242:	fs push esp
 244:	jns    0x2b6
 246:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 24b:	jbe    0x2ae
 24d:	das    
 24e:	ins    BYTE PTR es:[edi],dx
 24f:	popa   
 250:	outs   dx,BYTE PTR ds:[esi]
 251:	addr16 das 
 253:	push   ebx
 254:	je     0x2c8
 256:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 25d:	popa   
 25e:	jbe    0x2c1
 260:	das    
 261:	ins    BYTE PTR es:[edi],dx
 262:	popa   
 263:	outs   dx,BYTE PTR ds:[esi]
 264:	addr16 das 
 266:	dec    edi
 267:	bound  ebp,QWORD PTR [edx+0x65]
 26a:	arpl   WORD PTR [ebx+edi*1+0x29],si
 26e:	dec    esp
 26f:	push   0x61
 271:	jbe    0x2d4
 273:	das    
 274:	ins    BYTE PTR es:[edi],dx
 275:	popa   
 276:	outs   dx,BYTE PTR ds:[esi]
 277:	addr16 das 
 279:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 280:	inc    ebx
 281:	popa   
 282:	ins    BYTE PTR es:[edi],dx
 283:	ins    BYTE PTR es:[edi],dx
 284:	push   ebx
 285:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x1330007
 28d:	add    BYTE PTR ds:0x6176616a,ah
 293:	das    
 294:	ins    BYTE PTR es:[edi],dx
 295:	popa   
 296:	outs   dx,BYTE PTR ds:[esi]
 297:	addr16 das 
 299:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2a0:	dec    ebp
 2a1:	gs je  0x30c
 2a4:	outs   dx,DWORD PTR ds:[esi]
 2a5:	fs dec eax
 2a7:	popa   
 2a8:	outs   dx,BYTE PTR ds:[esi]
 2a9:	fs ins BYTE PTR es:[edi],dx
 2ab:	gs jae 0x2d2
 2ae:	dec    esp
 2af:	outs   dx,DWORD PTR ds:[esi]
 2b0:	outs   dx,DWORD PTR ds:[esi]
 2b1:	imul   esi,DWORD PTR [ebp+0x70],0x1
 2b5:	add    BYTE PTR [esi],bl
 2b7:	push   0x61
 2b9:	jbe    0x31c
 2bb:	das    
 2bc:	ins    BYTE PTR es:[edi],dx
 2bd:	popa   
 2be:	outs   dx,BYTE PTR ds:[esi]
 2bf:	addr16 das 
 2c1:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2c8:	dec    ebp
 2c9:	gs je  0x334
 2cc:	outs   dx,DWORD PTR ds:[esi]
 2cd:	fs dec eax
 2cf:	popa   
 2d0:	outs   dx,BYTE PTR ds:[esi]
 2d1:	fs ins BYTE PTR es:[edi],dx
 2d3:	gs jae 0x2d6
 2d6:	and    BYTE PTR [eax],al
 2d8:	or     eax,DWORD PTR [eax]
 2da:	or     al,0x0
 2dc:	add    BYTE PTR [eax],al
 2de:	add    BYTE PTR [eax],al
 2e0:	add    al,BYTE PTR [eax]
 2e2:	add    BYTE PTR [eax],al
 2e4:	or     eax,0x1000e00
 2e9:	add    BYTE PTR [edi],cl
 2eb:	add    BYTE PTR [eax],al
 2ed:	add    BYTE PTR ds:0x1000100,bl
 2f3:	add    BYTE PTR [eax],al
 2f5:	add    BYTE PTR ds:0x100b72a,al
 2fb:	mov    cl,0x0
 2fd:	add    BYTE PTR [eax],al
 2ff:	add    DWORD PTR [eax],eax
 301:	adc    BYTE PTR [eax],al
 303:	add    BYTE PTR [eax],al
 305:	push   es
 306:	add    BYTE PTR [ecx],al
 308:	add    BYTE PTR [eax],al
 30a:	add    BYTE PTR ds:0x11000900,al
 310:	add    BYTE PTR [edx],dl
 312:	add    BYTE PTR [ecx],al
 314:	add    BYTE PTR [edi],cl
 316:	add    BYTE PTR [eax],al
 318:	add    BYTE PTR [esi+0x0],bl
 31b:	push   es
 31c:	add    BYTE PTR [eax],cl
 31e:	add    BYTE PTR [eax],al
 320:	add    BYTE PTR [esi],ch
 322:	adc    BYTE PTR [ecx+0x3c],ah
 325:	adc    al,BYTE PTR [edx]
 327:	cmp    eax,0x14460312
 32c:	add    BYTE PTR [ecx+edi*1],al
 32f:	add    al,0x25
 331:	or     al,0x6a
 333:	sbb    al,0x1b
 335:	ins    BYTE PTR es:[edi],dx
 336:	xchg   BYTE PTR [edx-0x73],ah
 339:	sbb    BYTE PTR [esp+edx*1],al
 33c:	add    BYTE PTR [esi],al
 33e:	imul   esp,DWORD PTR [edi+0x39],0x6
 342:	mov    dl,0x0
 344:	or     BYTE PTR [eax],bl
 346:	push   es
 347:	mov    edx,0x900
 34c:	mov    dh,0x0
 34e:	or     dh,BYTE PTR [ecx+0x1000000]
 354:	add    BYTE PTR [eax],dl
 356:	add    BYTE PTR [eax],al
 358:	add    BYTE PTR [esi],bl
 35a:	add    BYTE PTR [edi],al
 35c:	add    BYTE PTR [eax],al
 35e:	add    BYTE PTR [eax+eax*1],cl
 361:	add    eax,DWORD PTR [eax]
 363:	or     eax,0xe000600
 368:	add    BYTE PTR [ecx],cl
 36a:	add    BYTE PTR [edi],cl
 36c:	add    BYTE PTR [esi],cl
 36e:	add    BYTE PTR [edx],dl
 370:	add    BYTE PTR [eax],ah
 372:	add    BYTE PTR [esi],dl
 374:	add    BYTE PTR ds:0x3001700,ch
 37a:	add    BYTE PTR [ebx],dl
 37c:	add    BYTE PTR [eax],al
 37e:	add    BYTE PTR [edx],al
 380:	add    BYTE PTR [eax+eax*1],dl
 383:	das    
 384:	add    BYTE PTR [eax],al
 386:	add    BYTE PTR [edx],cl
 388:	add    BYTE PTR [ecx],al
 38a:	add    BYTE PTR ds:0x2e003100,ch
 390:	add    BYTE PTR [ecx],bl
 392:	add    BYTE PTR [eax],bl
 394:	add    BYTE PTR [eax],al
 396:	add    BYTE PTR [eax],cl
 398:	add    BYTE PTR [ecx],al
 39a:	add    BYTE PTR [ecx],bl
 39c:	add    BYTE PTR [ecx],al
 39e:	add    BYTE PTR [edx],bl

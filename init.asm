
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	53                   	push   %ebx
   7:	83 ec 1c             	sub    $0x1c,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 e6 07 00 00 	movl   $0x7e6,(%esp)
  19:	e8 6a 03 00 00       	call   388 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 b6 00 00 00    	js     dc <main+0xdc>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 8e 03 00 00       	call   3c0 <dup>
  dup(0);  // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 82 03 00 00       	call   3c0 <dup>
  3e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  40:	c7 44 24 04 ee 07 00 	movl   $0x7ee,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 2c 04 00 00       	call   480 <printf>
    pid = fork();
  54:	e8 e7 02 00 00       	call   340 <fork>
    if(pid < 0){
  59:	83 f8 00             	cmp    $0x0,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
  5c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5e:	7c 28                	jl     88 <main+0x88>
      printf(1, "init: fork failed\n");
      exit(0);
    }
    if(pid == 0){
  60:	74 46                	je     a8 <main+0xa8>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit(0);
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  62:	e8 e9 02 00 00       	call   350 <wait>
  67:	85 c0                	test   %eax,%eax
  69:	78 d5                	js     40 <main+0x40>
  6b:	39 c3                	cmp    %eax,%ebx
  6d:	8d 76 00             	lea    0x0(%esi),%esi
  70:	74 ce                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  72:	c7 44 24 04 2d 08 00 	movl   $0x82d,0x4(%esp)
  79:	00 
  7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  81:	e8 fa 03 00 00       	call   480 <printf>
  86:	eb da                	jmp    62 <main+0x62>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  88:	c7 44 24 04 01 08 00 	movl   $0x801,0x4(%esp)
  8f:	00 
  90:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  97:	e8 e4 03 00 00       	call   480 <printf>
      exit(0);
  9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a3:	e8 a0 02 00 00       	call   348 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
  a8:	c7 44 24 04 50 08 00 	movl   $0x850,0x4(%esp)
  af:	00 
  b0:	c7 04 24 14 08 00 00 	movl   $0x814,(%esp)
  b7:	e8 c4 02 00 00       	call   380 <exec>
      printf(1, "init: exec sh failed\n");
  bc:	c7 44 24 04 17 08 00 	movl   $0x817,0x4(%esp)
  c3:	00 
  c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  cb:	e8 b0 03 00 00       	call   480 <printf>
      exit(0);
  d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d7:	e8 6c 02 00 00       	call   348 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  e3:	00 
  e4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 e6 07 00 00 	movl   $0x7e6,(%esp)
  f3:	e8 98 02 00 00       	call   390 <mknod>
    open("console", O_RDWR);
  f8:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  ff:	00 
 100:	c7 04 24 e6 07 00 00 	movl   $0x7e6,(%esp)
 107:	e8 7c 02 00 00       	call   388 <open>
 10c:	e9 15 ff ff ff       	jmp    26 <main+0x26>
 111:	90                   	nop
 112:	90                   	nop
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	55                   	push   %ebp
 121:	31 d2                	xor    %edx,%edx
 123:	89 e5                	mov    %esp,%ebp
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	53                   	push   %ebx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 130:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 134:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 c9                	test   %cl,%cl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	5b                   	pop    %ebx
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <strcmp>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 4d 08             	mov    0x8(%ebp),%ecx
 156:	53                   	push   %ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 15a:	0f b6 01             	movzbl (%ecx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 14                	jne    175 <strcmp+0x25>
 161:	eb 25                	jmp    188 <strcmp+0x38>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 168:	83 c1 01             	add    $0x1,%ecx
 16b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 16e:	0f b6 01             	movzbl (%ecx),%eax
 171:	84 c0                	test   %al,%al
 173:	74 13                	je     188 <strcmp+0x38>
 175:	0f b6 1a             	movzbl (%edx),%ebx
 178:	38 d8                	cmp    %bl,%al
 17a:	74 ec                	je     168 <strcmp+0x18>
 17c:	0f b6 db             	movzbl %bl,%ebx
 17f:	0f b6 c0             	movzbl %al,%eax
 182:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 188:	0f b6 1a             	movzbl (%edx),%ebx
 18b:	31 c0                	xor    %eax,%eax
 18d:	0f b6 db             	movzbl %bl,%ebx
 190:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 192:	5b                   	pop    %ebx
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    
 195:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strlen>:

uint
strlen(char *s)
{
 1a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1a1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 1a5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1aa:	80 39 00             	cmpb   $0x0,(%ecx)
 1ad:	74 0c                	je     1bb <strlen+0x1b>
 1af:	90                   	nop
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 11                	jne    202 <strchr+0x22>
 1f1:	eb 15                	jmp    208 <strchr+0x28>
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f8:	83 c0 01             	add    $0x1,%eax
 1fb:	0f b6 10             	movzbl (%eax),%edx
 1fe:	84 d2                	test   %dl,%dl
 200:	74 06                	je     208 <strchr+0x28>
    if(*s == c)
 202:	38 ca                	cmp    %cl,%dl
 204:	75 f2                	jne    1f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 208:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 20a:	5d                   	pop    %ebp
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <atoi>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 221:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 4d 08             	mov    0x8(%ebp),%ecx
 228:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	0f b6 11             	movzbl (%ecx),%edx
 22c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 22f:	80 fb 09             	cmp    $0x9,%bl
 232:	77 1c                	ja     250 <atoi+0x30>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 238:	0f be d2             	movsbl %dl,%edx
 23b:	83 c1 01             	add    $0x1,%ecx
 23e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 241:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 245:	0f b6 11             	movzbl (%ecx),%edx
 248:	8d 5a d0             	lea    -0x30(%edx),%ebx
 24b:	80 fb 09             	cmp    $0x9,%bl
 24e:	76 e8                	jbe    238 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	53                   	push   %ebx
 268:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 db                	test   %ebx,%ebx
 270:	7e 14                	jle    286 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 272:	31 d2                	xor    %edx,%edx
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 296:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 299:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 29c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 29f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ab:	00 
 2ac:	89 04 24             	mov    %eax,(%esp)
 2af:	e8 d4 00 00 00       	call   388 <open>
  if(fd < 0)
 2b4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2b8:	78 19                	js     2d3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 1c 24             	mov    %ebx,(%esp)
 2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c4:	e8 d7 00 00 00       	call   3a0 <fstat>
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2cc:	89 c6                	mov    %eax,%esi
  close(fd);
 2ce:	e8 9d 00 00 00       	call   370 <close>
  return r;
}
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2d8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2db:	89 ec                	mov    %ebp,%esp
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop

000002e0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	31 f6                	xor    %esi,%esi
 2e7:	53                   	push   %ebx
 2e8:	83 ec 2c             	sub    $0x2c,%esp
 2eb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ee:	eb 06                	jmp    2f6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f0:	3c 0a                	cmp    $0xa,%al
 2f2:	74 39                	je     32d <gets+0x4d>
 2f4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f6:	8d 5e 01             	lea    0x1(%esi),%ebx
 2f9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fc:	7d 31                	jge    32f <gets+0x4f>
    cc = read(0, &c, 1);
 2fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 301:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 308:	00 
 309:	89 44 24 04          	mov    %eax,0x4(%esp)
 30d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 314:	e8 47 00 00 00       	call   360 <read>
    if(cc < 1)
 319:	85 c0                	test   %eax,%eax
 31b:	7e 12                	jle    32f <gets+0x4f>
      break;
    buf[i++] = c;
 31d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 321:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 325:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 329:	3c 0d                	cmp    $0xd,%al
 32b:	75 c3                	jne    2f0 <gets+0x10>
 32d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 333:	89 f8                	mov    %edi,%eax
 335:	83 c4 2c             	add    $0x2c,%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 340:	b8 01 00 00 00       	mov    $0x1,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exit>:
SYSCALL(exit)
 348:	b8 02 00 00 00       	mov    $0x2,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <wait>:
SYSCALL(wait)
 350:	b8 03 00 00 00       	mov    $0x3,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <pipe>:
SYSCALL(pipe)
 358:	b8 04 00 00 00       	mov    $0x4,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <read>:
SYSCALL(read)
 360:	b8 05 00 00 00       	mov    $0x5,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <write>:
SYSCALL(write)
 368:	b8 10 00 00 00       	mov    $0x10,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <close>:
SYSCALL(close)
 370:	b8 15 00 00 00       	mov    $0x15,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <kill>:
SYSCALL(kill)
 378:	b8 06 00 00 00       	mov    $0x6,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <exec>:
SYSCALL(exec)
 380:	b8 07 00 00 00       	mov    $0x7,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <open>:
SYSCALL(open)
 388:	b8 0f 00 00 00       	mov    $0xf,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <mknod>:
SYSCALL(mknod)
 390:	b8 11 00 00 00       	mov    $0x11,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <unlink>:
SYSCALL(unlink)
 398:	b8 12 00 00 00       	mov    $0x12,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <fstat>:
SYSCALL(fstat)
 3a0:	b8 08 00 00 00       	mov    $0x8,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <link>:
SYSCALL(link)
 3a8:	b8 13 00 00 00       	mov    $0x13,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <mkdir>:
SYSCALL(mkdir)
 3b0:	b8 14 00 00 00       	mov    $0x14,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <chdir>:
SYSCALL(chdir)
 3b8:	b8 09 00 00 00       	mov    $0x9,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <dup>:
SYSCALL(dup)
 3c0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <getpid>:
SYSCALL(getpid)
 3c8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <sbrk>:
SYSCALL(sbrk)
 3d0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <sleep>:
SYSCALL(sleep)
 3d8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <uptime>:
SYSCALL(uptime)
 3e0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <test>:
SYSCALL(test)
 3e8:	b8 16 00 00 00       	mov    $0x16,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	89 cf                	mov    %ecx,%edi
 3f6:	56                   	push   %esi
 3f7:	89 c6                	mov    %eax,%esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 400:	85 c9                	test   %ecx,%ecx
 402:	74 04                	je     408 <printint+0x18>
 404:	85 d2                	test   %edx,%edx
 406:	78 68                	js     470 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 408:	89 d0                	mov    %edx,%eax
 40a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 411:	31 c9                	xor    %ecx,%ecx
 413:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 416:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 418:	31 d2                	xor    %edx,%edx
 41a:	f7 f7                	div    %edi
 41c:	0f b6 92 3d 08 00 00 	movzbl 0x83d(%edx),%edx
 423:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 426:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 429:	85 c0                	test   %eax,%eax
 42b:	75 eb                	jne    418 <printint+0x28>
  if(neg)
 42d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 430:	85 c0                	test   %eax,%eax
 432:	74 08                	je     43c <printint+0x4c>
    buf[i++] = '-';
 434:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 439:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 43c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 43f:	90                   	nop
 440:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
 444:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 447:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44e:	00 
 44f:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 452:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 455:	8d 45 e7             	lea    -0x19(%ebp),%eax
 458:	89 44 24 04          	mov    %eax,0x4(%esp)
 45c:	e8 07 ff ff ff       	call   368 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 461:	83 ff ff             	cmp    $0xffffffff,%edi
 464:	75 da                	jne    440 <printint+0x50>
    putc(fd, buf[i]);
}
 466:	83 c4 4c             	add    $0x4c,%esp
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5f                   	pop    %edi
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    
 46e:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 470:	89 d0                	mov    %edx,%eax
 472:	f7 d8                	neg    %eax
 474:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 47b:	eb 94                	jmp    411 <printint+0x21>
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 489:	8b 45 0c             	mov    0xc(%ebp),%eax
 48c:	0f b6 10             	movzbl (%eax),%edx
 48f:	84 d2                	test   %dl,%dl
 491:	0f 84 c1 00 00 00    	je     558 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 497:	8d 4d 10             	lea    0x10(%ebp),%ecx
 49a:	31 ff                	xor    %edi,%edi
 49c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 49f:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4a1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4a4:	eb 1e                	jmp    4c4 <printf+0x44>
 4a6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4a8:	83 fa 25             	cmp    $0x25,%edx
 4ab:	0f 85 af 00 00 00    	jne    560 <printf+0xe0>
 4b1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b5:	83 c3 01             	add    $0x1,%ebx
 4b8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4bc:	84 d2                	test   %dl,%dl
 4be:	0f 84 94 00 00 00    	je     558 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 4c4:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4c6:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 4c9:	74 dd                	je     4a8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4cb:	83 ff 25             	cmp    $0x25,%edi
 4ce:	75 e5                	jne    4b5 <printf+0x35>
      if(c == 'd'){
 4d0:	83 fa 64             	cmp    $0x64,%edx
 4d3:	0f 84 3f 01 00 00    	je     618 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4d9:	83 fa 70             	cmp    $0x70,%edx
 4dc:	0f 84 a6 00 00 00    	je     588 <printf+0x108>
 4e2:	83 fa 78             	cmp    $0x78,%edx
 4e5:	0f 84 9d 00 00 00    	je     588 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4eb:	83 fa 73             	cmp    $0x73,%edx
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	0f 84 ba 00 00 00    	je     5b0 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4f6:	83 fa 63             	cmp    $0x63,%edx
 4f9:	0f 84 41 01 00 00    	je     640 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4ff:	83 fa 25             	cmp    $0x25,%edx
 502:	0f 84 00 01 00 00    	je     608 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 508:	8b 4d 08             	mov    0x8(%ebp),%ecx
 50b:	89 55 cc             	mov    %edx,-0x34(%ebp)
 50e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 512:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 519:	00 
 51a:	89 74 24 04          	mov    %esi,0x4(%esp)
 51e:	89 0c 24             	mov    %ecx,(%esp)
 521:	e8 42 fe ff ff       	call   368 <write>
 526:	8b 55 cc             	mov    -0x34(%ebp),%edx
 529:	88 55 e7             	mov    %dl,-0x19(%ebp)
 52c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 52f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 532:	31 ff                	xor    %edi,%edi
 534:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 53b:	00 
 53c:	89 74 24 04          	mov    %esi,0x4(%esp)
 540:	89 04 24             	mov    %eax,(%esp)
 543:	e8 20 fe ff ff       	call   368 <write>
 548:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 54b:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 54f:	84 d2                	test   %dl,%dl
 551:	0f 85 6d ff ff ff    	jne    4c4 <printf+0x44>
 557:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 558:	83 c4 3c             	add    $0x3c,%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5f                   	pop    %edi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 560:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 563:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 566:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56d:	00 
 56e:	89 74 24 04          	mov    %esi,0x4(%esp)
 572:	89 04 24             	mov    %eax,(%esp)
 575:	e8 ee fd ff ff       	call   368 <write>
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	e9 33 ff ff ff       	jmp    4b5 <printf+0x35>
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 588:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 58b:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 590:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 592:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 599:	8b 10                	mov    (%eax),%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 4d fe ff ff       	call   3f0 <printint>
 5a3:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5a6:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5aa:	e9 06 ff ff ff       	jmp    4b5 <printf+0x35>
 5af:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 5b0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
 5b3:	b9 36 08 00 00       	mov    $0x836,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 5b8:	8b 3a                	mov    (%edx),%edi
        ap++;
 5ba:	83 c2 04             	add    $0x4,%edx
 5bd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 5c0:	85 ff                	test   %edi,%edi
 5c2:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
 5c5:	0f b6 17             	movzbl (%edi),%edx
 5c8:	84 d2                	test   %dl,%dl
 5ca:	74 33                	je     5ff <printf+0x17f>
 5cc:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
 5d8:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5db:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e5:	00 
 5e6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5ea:	89 1c 24             	mov    %ebx,(%esp)
 5ed:	e8 76 fd ff ff       	call   368 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5f2:	0f b6 17             	movzbl (%edi),%edx
 5f5:	84 d2                	test   %dl,%dl
 5f7:	75 df                	jne    5d8 <printf+0x158>
 5f9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5fc:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ff:	31 ff                	xor    %edi,%edi
 601:	e9 af fe ff ff       	jmp    4b5 <printf+0x35>
 606:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 608:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60c:	e9 1b ff ff ff       	jmp    52c <printf+0xac>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 61b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 620:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 623:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 62a:	8b 10                	mov    (%eax),%edx
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	e8 bc fd ff ff       	call   3f0 <printint>
 634:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 637:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 63b:	e9 75 fe ff ff       	jmp    4b5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 640:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
 643:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 645:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 648:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 64a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 651:	00 
 652:	89 74 24 04          	mov    %esi,0x4(%esp)
 656:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 659:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 65c:	e8 07 fd ff ff       	call   368 <write>
 661:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 664:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 668:	e9 48 fe ff ff       	jmp    4b5 <printf+0x35>
 66d:	90                   	nop
 66e:	90                   	nop
 66f:	90                   	nop

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 60 08 00 00       	mov    0x860,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	39 c8                	cmp    %ecx,%eax
 683:	73 1d                	jae    6a2 <free+0x32>
 685:	8d 76 00             	lea    0x0(%esi),%esi
 688:	8b 10                	mov    (%eax),%edx
 68a:	39 d1                	cmp    %edx,%ecx
 68c:	72 1a                	jb     6a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68e:	39 d0                	cmp    %edx,%eax
 690:	72 08                	jb     69a <free+0x2a>
 692:	39 c8                	cmp    %ecx,%eax
 694:	72 12                	jb     6a8 <free+0x38>
 696:	39 d1                	cmp    %edx,%ecx
 698:	72 0e                	jb     6a8 <free+0x38>
 69a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	66 90                	xchg   %ax,%ax
 6a0:	72 e6                	jb     688 <free+0x18>
 6a2:	8b 10                	mov    (%eax),%edx
 6a4:	eb e8                	jmp    68e <free+0x1e>
 6a6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 71 04             	mov    0x4(%ecx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 d7                	cmp    %edx,%edi
 6b0:	74 19                	je     6cb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bb:	39 ce                	cmp    %ecx,%esi
 6bd:	74 23                	je     6e2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c1:	a3 60 08 00 00       	mov    %eax,0x860
}
 6c6:	5b                   	pop    %ebx
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6cb:	03 72 04             	add    0x4(%edx),%esi
 6ce:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d1:	8b 10                	mov    (%eax),%edx
 6d3:	8b 12                	mov    (%edx),%edx
 6d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6d8:	8b 50 04             	mov    0x4(%eax),%edx
 6db:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6de:	39 ce                	cmp    %ecx,%esi
 6e0:	75 dd                	jne    6bf <free+0x4f>
    p->s.size += bp->s.size;
 6e2:	03 51 04             	add    0x4(%ecx),%edx
 6e5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6eb:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 6ed:	a3 60 08 00 00       	mov    %eax,0x860
}
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	89 f6                	mov    %esi,%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 70c:	8b 0d 60 08 00 00    	mov    0x860,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	83 c3 07             	add    $0x7,%ebx
 715:	c1 eb 03             	shr    $0x3,%ebx
 718:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 71b:	85 c9                	test   %ecx,%ecx
 71d:	0f 84 9b 00 00 00    	je     7be <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 723:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 725:	8b 50 04             	mov    0x4(%eax),%edx
 728:	39 d3                	cmp    %edx,%ebx
 72a:	76 27                	jbe    753 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 72c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 733:	be 00 80 00 00       	mov    $0x8000,%esi
 738:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 73b:	90                   	nop
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 740:	3b 05 60 08 00 00    	cmp    0x860,%eax
 746:	74 30                	je     778 <malloc+0x78>
 748:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 74c:	8b 50 04             	mov    0x4(%eax),%edx
 74f:	39 d3                	cmp    %edx,%ebx
 751:	77 ed                	ja     740 <malloc+0x40>
      if(p->s.size == nunits)
 753:	39 d3                	cmp    %edx,%ebx
 755:	74 61                	je     7b8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 757:	29 da                	sub    %ebx,%edx
 759:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 75c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 75f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 762:	89 0d 60 08 00 00    	mov    %ecx,0x860
      return (void*)(p + 1);
 768:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 76b:	83 c4 2c             	add    $0x2c,%esp
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77b:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 781:	bf 00 10 00 00       	mov    $0x1000,%edi
 786:	0f 43 fb             	cmovae %ebx,%edi
 789:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 78c:	89 04 24             	mov    %eax,(%esp)
 78f:	e8 3c fc ff ff       	call   3d0 <sbrk>
  if(p == (char*)-1)
 794:	83 f8 ff             	cmp    $0xffffffff,%eax
 797:	74 18                	je     7b1 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 799:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 79c:	83 c0 08             	add    $0x8,%eax
 79f:	89 04 24             	mov    %eax,(%esp)
 7a2:	e8 c9 fe ff ff       	call   670 <free>
  return freep;
 7a7:	8b 0d 60 08 00 00    	mov    0x860,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7ad:	85 c9                	test   %ecx,%ecx
 7af:	75 99                	jne    74a <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7b1:	31 c0                	xor    %eax,%eax
 7b3:	eb b6                	jmp    76b <malloc+0x6b>
 7b5:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7b8:	8b 10                	mov    (%eax),%edx
 7ba:	89 11                	mov    %edx,(%ecx)
 7bc:	eb a4                	jmp    762 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7be:	c7 05 60 08 00 00 58 	movl   $0x858,0x860
 7c5:	08 00 00 
    base.s.size = 0;
 7c8:	b9 58 08 00 00       	mov    $0x858,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7cd:	c7 05 58 08 00 00 58 	movl   $0x858,0x858
 7d4:	08 00 00 
    base.s.size = 0;
 7d7:	c7 05 5c 08 00 00 00 	movl   $0x0,0x85c
 7de:	00 00 00 
 7e1:	e9 3d ff ff ff       	jmp    723 <malloc+0x23>
